import UIKit

final class SettingsProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    private let settingsProfileView = SettingsProfileView()
    
    private var userImageView = UIImageView()
    
    private var nameTextField = UITextField()
    private var aboutInfoTextField = UITextField()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = settingsProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePhotoImageView()
        addKeyboardNotification()
        setDelegates()
        addKeyboardNotification()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Behaviour
    
    private func setDelegates() {
        nameTextField = settingsProfileView.nameTextField
        aboutInfoTextField = settingsProfileView.aboutInfoTextField
        
        settingsProfileView.delegate = self
    }
    
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Buttons' tapp
    @objc private func userImageViewTapped() {
        presentPhotoActionAlert()
    }
    
    private func configurePhotoImageView() {
        userImageView = settingsProfileView.userImageView
        let photoTapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(userImageViewTapped))
        userImageView.addGestureRecognizer(photoTapRecognizer)
    }
    
    // MARK: - Appearance
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (
            notification.userInfo?[
                UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

// MARK: - SettingsProfileViewDelegate

extension SettingsProfileViewController: SettingsProfileViewDelegate {
    func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    func goToChatButtonDidTap() {
        print("CHAT")
    }
}

//MARK: - UIImagePickerControllerDelegate

extension SettingsProfileViewController: UIImagePickerControllerDelegate {
    
    private func presentPhotoActionAlert() {
        let changeAlert = UIAlertController(
            title: "Фото для профиля",
            message: "Хотите создать новое фото или выбрать из существующих?",
            preferredStyle: .actionSheet)
        
        changeAlert.addAction(UIAlertAction(
            title: "Сделать фото", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        
        changeAlert.addAction(UIAlertAction(
            title: "Выбрать из галереи", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        changeAlert.addAction(
            UIAlertAction(title: "Отменить", style: .cancel))
        
        present(changeAlert, animated: true)
    }
    
    private func presentPhotoPicker() {
        let photoPickerVC = UIImagePickerController()
        photoPickerVC.sourceType = .photoLibrary
        photoPickerVC.delegate = self
        photoPickerVC.allowsEditing = true
        present(photoPickerVC, animated: true)
    }
    
    private func presentCamera() {
        let photoPickerVC = UIImagePickerController()
        photoPickerVC.sourceType = .camera
        photoPickerVC.delegate = self
        photoPickerVC.allowsEditing = true
        present(photoPickerVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        userImageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

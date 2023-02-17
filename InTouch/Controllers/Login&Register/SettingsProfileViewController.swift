import UIKit

class SettingsProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - UI Constants
    
    private let settingsProfileView = SettingsProfileView()
    private var backButton = UIButton()
    private var userPhotoView = UIImageView()
    private var goToChatButton = UIButton()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = settingsProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton = settingsProfileView.backButton
        hideKeyboardWhenTappedAround()
        setUIValues()
        setTapRecognizer()
        addTargets()
        
        //Notification for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Behavior
    
    private func addTargets() {
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        goToChatButton.addTarget(self, action: #selector(goToChatButtonPressed), for: .touchUpInside)
    }
    
    private func setTapRecognizer() {
        let photoTapRecognizer = UITapGestureRecognizer(target: self,
                                                        action: #selector(userPhotoImagePressed))
        userPhotoView.isUserInteractionEnabled = true
        userPhotoView.addGestureRecognizer(photoTapRecognizer)
    }
    
    //Buttons' tapp
    @objc private func userPhotoImagePressed() {
        presentPhotoActionAlert()
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func goToChatButtonPressed() {
        
    }
    
    //MARK: - Appearance
    
    private func setUIValues() {
        userPhotoView = settingsProfileView.userPhotoView
        goToChatButton = settingsProfileView.goToChatButton
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
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

//MARK: - UIImagePickerControllerDelegate

extension SettingsProfileViewController: UIImagePickerControllerDelegate {
    
    private func presentPhotoActionAlert() {
        let changeAlert = UIAlertController(title: "Фото для профиля",
                                            message: "Хотите создать новое фото или выбрать из существующих?",
                                            preferredStyle: .actionSheet)
        
        changeAlert.addAction(UIAlertAction(title: "Сделать фото",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentCamera()
        }))
        
        changeAlert.addAction(UIAlertAction(title: "Выбрать из галереи",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        changeAlert.addAction(UIAlertAction(title: "Отменить",
                                            style: .cancel))
        
        present(changeAlert, animated: true)
    }
    
    private func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        userPhotoView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

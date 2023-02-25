import UIKit

/// In this clas user can register a new account
final class RegisterViewController: UIViewController {
    
    private let registerView = RegisterView()
    
    private lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField = registerView.emailTextField
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField = registerView.passwordTextField
        return textField
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        var textField = UITextField()
        textField = registerView.confirmPasswordTextField
        return textField
    }()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        hideKeyboardWhenTappedAround()
    }
    
    private func setDelegates() {
        registerView.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
}

// MARK: - RegisterViewDelegate

extension RegisterViewController: RegisterViewDelegate {
    func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    func registerButtonDidTap() {
        AuthService.shared.register(
            email: emailTextField.text, password: passwordTextField.text,
            confirmPassword: confirmPasswordTextField.text) { result in
                switch result {
                case .success(_):
                    let settingsProfileVC = SettingsProfileViewController()
                    settingsProfileVC.modalTransitionStyle = .crossDissolve
                    settingsProfileVC.modalPresentationStyle = .fullScreen
                    self.present(settingsProfileVC, animated: true)
                case .failure(let error):
                    self.showAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.navigationController?.isNavigationBarHidden = true
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            registerButtonDidTap()
        default:
            break
        }
        return true
    }
}

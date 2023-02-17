import UIKit

final class RegisterViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - UI Constants
    
    private let registerView = RegisterView()
    private var registerButton = UIButton()
    private var backButton = UIButton()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var confirmPasswordTextField = UITextField()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        setTargets()
        setDelegates()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Behaviour
    
    @objc private func registerButtonPressed() {
        AuthService.shared.register(email: emailTextField.text,
                                    password: passwordTextField.text,
                                    confirmPassword: confirmPasswordTextField.text) { (result) in
            switch result {
            case .success(_):
                self.goToSettingsVC()
            case .failure(let error):
                self.showAlert(title: "Ошибка", message: error.localizedDescription)
            }
        }
    }
    
    private func setTargets() {
        registerButton.addTarget(self,
                                 action: #selector(registerButtonPressed),
                                 for: .touchUpInside)
        backButton.addTarget(self,
                             action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func goToSettingsVC() {
                let settingsProfileVC = SettingsProfileViewController()
                settingsProfileVC.modalTransitionStyle = .crossDissolve
                settingsProfileVC.modalPresentationStyle = .fullScreen
                present(settingsProfileVC, animated: true)
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        backButton = registerView.backButton
        registerButton = registerView.registerButton
        emailTextField = registerView.emailTextField
        passwordTextField = registerView.passwordTextField
        confirmPasswordTextField = registerView.confirmPasswordTextField
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
            registerButtonPressed()
        default:
            break
        }
        return true
    }
}

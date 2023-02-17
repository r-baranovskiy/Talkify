import UIKit

final class LoginViewController: UIViewController {
    
    private let logivView = LoginView()
    
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = logivView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        hideKeyboardWhenTappedAround()
    }
    
    private func setDelegates() {
        emailTextField = logivView.emailTextField
        passwordTextField = logivView.passwordTextField
        
        logivView.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func loginButtonDidTap() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        AuthService.shared.login(
            email: emailTextField.text,
            password: passwordTextField.text) { (result) in
                switch result {
                case .success(_):
                    let mainTabBarVC = MainTabBarViewController()
                    mainTabBarVC.modalTransitionStyle = .partialCurl
                    mainTabBarVC.modalPresentationStyle = .fullScreen
                    self.present(mainTabBarVC, animated: false)
                case .failure(let error):
                    self.showAlert(title: error.localizedDescription, message: "")
                }
            }
    }
    
    func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    func forgetButtonDidTap() {
        print("forget")
    }
    
    func googleButtonDidTap() {
        print("google")
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonDidTap()
        }
        return true
    }
}

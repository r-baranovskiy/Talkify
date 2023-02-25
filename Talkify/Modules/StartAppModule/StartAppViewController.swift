import UIKit

/// This class loads first if the user isn't authorised
final class StartAppViewController: UIViewController {
    
    private let startAppView = StartAppView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = startAppView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAppView.delegate = self
    }
}

extension StartAppViewController: StartAppViewDelegate {
    func googleButtonDidTap() {
        print("Google!!!")
    }
    
    func loginButtonDidTap() {
        let loginVC = LoginViewController()
        loginVC.modalTransitionStyle = .crossDissolve
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    func registerButtonDidTap() {
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = .crossDissolve
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
}

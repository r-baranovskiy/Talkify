import UIKit

/// This class loads first if the user isn't authorised
final class StartViewAppController: UIViewController {
    
    private let startViewApp = StartViewApp()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = startViewApp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startViewApp.delegate = self
    }
}

extension StartViewAppController: StartViewAppDelegate {
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

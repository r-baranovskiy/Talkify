import UIKit

class StartViewController: UIViewController {
    
    private let startView = StartView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.delegate = self
    }
}

extension StartViewController: StartViewDelegate {
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

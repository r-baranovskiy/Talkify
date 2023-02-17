import UIKit

class StartViewController: UIViewController {
    
    //MARK: - UI constants
    
    private let startView = StartView()
    private var loginButton = UIButton()
    private var registerButton = UIButton()
    
    //MARK: - Lifecycles

    override func loadView() {
        super.loadView()
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        setTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //MARK: - Behaviour
    
    private func setTargets() {
        loginButton.addTarget(self,
                              action: #selector(loginButtonPressed),
                              for: .touchUpInside)
        registerButton.addTarget(self,
                                 action: #selector(registerButtonPressed),
                                 for: .touchUpInside)
    }
    
    @objc private func registerButtonPressed() {
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = .crossDissolve
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
    
    @objc private func loginButtonPressed() {
        let loginVC = LoginViewController()
        loginVC.modalTransitionStyle = .crossDissolve
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        loginButton = startView.loginButton
        registerButton = startView.registerButton
    }
}


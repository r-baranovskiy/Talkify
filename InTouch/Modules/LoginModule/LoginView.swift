import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonDidTap()
    func backButtonDidTap()
    func forgetButtonDidTap()
    func googleButtonDidTap()
}

/// This view class that displays in LoginViewController
final class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    //MARK: - UI Constants
    
    private var containerView = UIView()
    
    private let googleLabel = UILabel(text: "Войти через:", font: .avenir20())
    
    //TextFields
    private (set) var emailTextField = CustomTextField(
        placeholder: "Email", keyboardType: .emailAddress)
    private (set) var passwordTextField = CustomTextField(
        placeholder: "Password", isSecure: true)
    
    //Buttons
    private let loginButton = CustomButton(text: "Войти", isShadow: false)
    private let backButton = CustomButton.createBackButton()
    
    private let forgetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let googleButton: UIButton = {
        let button = CustomButton(text: "Google", isShadow: true)
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        CustomButton.createGoogleButton(button)
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.CustomColor.startBackground.color
        setTargets()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Behaviour
    
    private func setTargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped),
                              for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped),
                             for: .touchUpInside)
        forgetButton.addTarget(self, action: #selector(forgetButtonTapped),
                              for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTapped),
                               for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonDidTap()
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonDidTap()
    }
    
    @objc private func forgetButtonTapped() {
        delegate?.forgetButtonDidTap()
    }
    
    @objc private func googleButtonTapped() {
        delegate?.googleButtonDidTap()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        addSubviewWithoutTranslates(
            backButton, containerView, emailTextField, passwordTextField,
            forgetButton, loginButton, googleLabel, googleButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            containerView.topAnchor.constraint(
                equalTo: backButton.bottomAnchor, constant: 100),
            containerView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 40),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -40),
            
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailTextField.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            forgetButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor, constant: 20),
            forgetButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor),
            forgetButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor),
            forgetButton.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(
                equalTo: forgetButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            
            googleLabel.topAnchor.constraint(
                equalTo: loginButton.bottomAnchor, constant: 40),
            googleLabel.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor),
            
            googleButton.topAnchor.constraint(
                equalTo: googleLabel.bottomAnchor, constant: 20),
            googleButton.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor, constant: 40),
            googleButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor, constant: -40)
        ])
    }
}

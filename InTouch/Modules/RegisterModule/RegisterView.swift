import UIKit

protocol RegisterViewDelegate: AnyObject {
    func backButtonDidTap()
    func registerButtonDidTap()
}

/// This view class that displays in RegisterViewController
final class RegisterView: UIView {
    
    weak var delegate: RegisterViewDelegate?
    
    //MARK: - UI Constants
    
    //Containers
    private var fieldsStackView = UIStackView()
    
    //TextFields
    private (set) var emailTextField = CustomTextField(
        placeholder: "Email", keyboardType: .emailAddress)
    private (set) var passwordTextField = CustomTextField(
        placeholder: "Пароль", isSecure: true)
    private (set) var confirmPasswordTextField = CustomTextField(
        placeholder: "Подтвердите пароль", returnKeyType: .join, isSecure: true)
    
    //Buttons
    private let backButton = CustomButton.createBackButton()
    private let registerButton = CustomButton(
        text: "Регистрация", isShadow: false)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .backgoundImage()
        configureStackView()
        setTargets()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Behaviour
    
    private func setTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped),
                             for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped),
                                 for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonDidTap()
    }
    
    @objc private func registerButtonTapped() {
        delegate?.registerButtonDidTap()
    }
    
    //MARK: - Appearance
    
    private func configureStackView() {
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 20
        fieldsStackView.distribution = .fillEqually
        
        let textFieldsArray: [UITextField] = [emailTextField,
                                              passwordTextField,
                                              confirmPasswordTextField]
        
        textFieldsArray.forEach { fieldsStackView.addArrangedSubview($0) }
        textFieldsArray.forEach { $0.heightAnchor.constraint(
            equalToConstant: 52).isActive = true }
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        addSubviewWithoutTranslates(fieldsStackView, registerButton, backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            fieldsStackView.topAnchor.constraint(
                equalTo: backButton.bottomAnchor, constant: 90),
            fieldsStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 40),
            fieldsStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -40),
            
            registerButton.topAnchor.constraint(
                equalTo: fieldsStackView.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 80),
            registerButton.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -80),
            registerButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

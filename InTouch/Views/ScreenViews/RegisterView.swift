import UIKit

class RegisterView: UIView {
    
    //MARK: - UI
    
    //Containers
    private var fieldsStackView = UIStackView()
    
    //TextFields
    let emailTextField = CustomTextField(placeholder: "Email",
                                                         keyboardType: .emailAddress)
    let passwordTextField = CustomTextField(placeholder: "Пароль",
                                                            isSecure: true)
    let confirmPasswordTextField = CustomTextField(placeholder: "Подтвердите пароль",
                                                                   returnKeyType: .join,
                                                                   isSecure: true)
    
    //Buttons
    let backButton = CustomButton.createBackButton()
    let registerButton = CustomButton(text: "Регистрация",
                                      isShadow: false)

    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .backgoundImage()
        configureStackView()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    private func addSubviews() {
        addSubiewWithoutAutoresizing(fieldsStackView)
        addSubiewWithoutAutoresizing(registerButton)
        addSubiewWithoutAutoresizing(backButton)
    }
    
    private func configureStackView() {
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 20
        fieldsStackView.distribution = .fillEqually
        
        let textFieldsArray: [UITextField] = [emailTextField,
                                              passwordTextField,
                                              confirmPasswordTextField]
        
        textFieldsArray.forEach { fieldsStackView.addArrangedSubview($0) }
        textFieldsArray.forEach { $0.heightAnchor.constraint(equalToConstant: 52).isActive = true }
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            fieldsStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 90),
            fieldsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            fieldsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            registerButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            registerButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

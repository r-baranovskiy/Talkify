import UIKit

protocol SettingsProfileViewDelegate: AnyObject {
    func backButtonDidTap()
    func goToChatButtonDidTap()
}

final class SettingsProfileView: UIView {
    
    weak var delegate: SettingsProfileViewDelegate?
    
    //MARK: - UI Constants
    
    //Labels
    private let welcomeLabel = UILabel(
        text: "Ваш профиль", font: .avenir40(),
        adjustsFontSizeToFitWidth: true, alignment: .center)
    
    private let nameLabel = UILabel(text: "Имя (никнейм)", font: .avenir20())
    private let aboutInfoLabel = UILabel(text: "О себе:", font: .avenir20())
    private let sexLabel = UILabel(text: "Ваш пол:", font: .avenir20())
    
    //Buttons
    private let backButton = CustomButton.createBackButton()
    private let goToChatButton = CustomButton.createNavButton(title: "Общаться")
    
    //TextFields
    private (set) var nameTextField = CustomTextField.oneLineTextField()
    private (set) var aboutInfoTextField = CustomTextField.oneLineTextField()
    
    private (set) var userImageView: UIImageView = {
        let imageView = UIImageView(
            imageName: Images.emptyUserImage.rawValue,
            contentMode: .scaleAspectFit, addBorder: true)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let sexSegmentedControl = UISegmentedControl(items: ["Мужской", "Женский"])
    
    //Containers
    private var nameStackView = UIStackView()
    private var aboutInfoStackView = UIStackView()
    private var sexStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.CustomColor.mainBackground.color
        sexSegmentedControl.selectedSegmentIndex = 0
        configureStackViews()
        setTargets()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    // MARK: - Behaviour
    
    private func setTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped),
                             for: .touchUpInside)
        goToChatButton.addTarget(self, action: #selector(goToChatButtonTapped),
                                 for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        delegate?.backButtonDidTap()
    }
    
    @objc private func goToChatButtonTapped() {
        delegate?.goToChatButtonDidTap()
    }
    
    //MARK: - Configue StackViews
    
    private func configureStackViews() {
        nameStackView = UIStackView(
            arrangedSubviews: [nameLabel, nameTextField],
            axis: .vertical, spacing: 5, alignment: .fill)
        
        aboutInfoStackView = UIStackView(
            arrangedSubviews: [aboutInfoLabel, aboutInfoTextField],
            axis: .vertical, spacing: 5, alignment: .fill)
        
        sexStackView = UIStackView(
            arrangedSubviews: [sexLabel, sexSegmentedControl],
            axis: .vertical, spacing: 10, alignment: .fill)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        addSubviewWithoutTranslates(
            welcomeLabel, backButton, userImageView, nameStackView,
            aboutInfoStackView, sexStackView, goToChatButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            welcomeLabel.topAnchor.constraint(
                greaterThanOrEqualTo: backButton.bottomAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            
            userImageView.topAnchor.constraint(
                equalTo: welcomeLabel.bottomAnchor, constant: 20),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.widthAnchor.constraint(
                equalTo: widthAnchor, multiplier: 0.35),
            userImageView.heightAnchor.constraint(
                equalTo: userImageView.widthAnchor),
            
            nameStackView.topAnchor.constraint(
                lessThanOrEqualTo: userImageView.bottomAnchor, constant: 50),
            nameStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            nameStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            
            aboutInfoStackView.topAnchor.constraint(
                lessThanOrEqualTo: nameStackView.bottomAnchor, constant: 50),
            aboutInfoStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            aboutInfoStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            
            sexStackView.topAnchor.constraint(
                equalTo: aboutInfoStackView.bottomAnchor, constant: 20),
            sexStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            sexStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            
            goToChatButton.topAnchor.constraint(
                equalTo: sexStackView.bottomAnchor, constant: 40),
            goToChatButton.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 80),
            goToChatButton.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -80),
            goToChatButton.bottomAnchor.constraint(
                greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goToChatButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

import UIKit

class SettingsProfileView: UIView {
    
    //MARK: - UI Constants
    
    private let welcomeLabel = UILabel(text: "Ваш профиль",
                                       font: .avenir40(),
                                       textColor: .label,
                                       adjustsFontSizeToFitWidth: true,
                                       alignment: .center)
    
    let userPhotoView = UIImageView(imageName: KeysImages.emptyPhoto.rawValue,
                                    contentMode: .scaleAspectFit,
                                    addBorder: true)
    
    let sexSegmentedControl = UISegmentedControl(items: ["Мужской", "Женский"])
    
    //Buttons
    let backButton = CustomButton.createBackButton()
    let goToChatButton = CustomButton(text: "Общаться!",
                                      isShadow: true)
    
    //TextFields
    let nameTextField = CustomTextField.oneLineTextField()
    let aboutInfoTextField = CustomTextField.oneLineTextField()
    
    //Labels
    private let nameLabel = UILabel(text: "Имя (никнейм)",
                                    font: .avenir20(),
                                    textColor: .label,
                                    adjustsFontSizeToFitWidth: false)
    
    private let aboutInfoLabel = UILabel(text: "О себе:",
                                         font: .avenir20(),
                                         textColor: .label,
                                         adjustsFontSizeToFitWidth: false)
    
    private let sexLabel = UILabel(text: "Ваш пол:",
                                   font: .avenir20(),
                                   textColor: .label,
                                   adjustsFontSizeToFitWidth: false)
    //Containers
    private var nameStackView = UIStackView()
    private var aboutInfoStackView = UIStackView()
    private var sexStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .backgoundImage()
        sexSegmentedControl.selectedSegmentIndex = 0
        configureStackViews()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhotoView.layer.cornerRadius = userPhotoView.frame.height / 2
    }
    
    //MARK: - Configue
    
    private func configureStackViews() {
        nameStackView = UIStackView(arrangedSubviews:
                                        [nameLabel,
                                         nameTextField],
                                    axis: .vertical,
                                    spacing: 5,
                                    alignment: .fill)
        
        aboutInfoStackView = UIStackView(arrangedSubviews: [aboutInfoLabel,
                                                            aboutInfoTextField],
                                         axis: .vertical,
                                         spacing: 5,
                                         alignment: .fill)
        
        sexStackView = UIStackView(arrangedSubviews: [sexLabel,
                                                      sexSegmentedControl],
                                   axis: .vertical,
                                   spacing: 10,
                                   alignment: .fill)
    }
    
    private func addSubviews() {
        addSubiewWithoutAutoresizing(welcomeLabel)
        addSubiewWithoutAutoresizing(backButton)
        addSubiewWithoutAutoresizing(userPhotoView)
        addSubiewWithoutAutoresizing(nameStackView)
        addSubiewWithoutAutoresizing(aboutInfoStackView)
        addSubiewWithoutAutoresizing(sexStackView)
        addSubiewWithoutAutoresizing(goToChatButton)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            welcomeLabel.topAnchor.constraint(greaterThanOrEqualTo: backButton.bottomAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            userPhotoView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            userPhotoView.heightAnchor.constraint(equalTo: userPhotoView.widthAnchor),
            
            nameStackView.topAnchor.constraint(lessThanOrEqualTo: userPhotoView.bottomAnchor, constant: 50),
            nameStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            aboutInfoStackView.topAnchor.constraint(lessThanOrEqualTo: nameStackView.bottomAnchor, constant: 50),
            aboutInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            aboutInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            sexStackView.topAnchor.constraint(equalTo: aboutInfoStackView.bottomAnchor, constant: 20),
            sexStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sexStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            goToChatButton.topAnchor.constraint(equalTo: sexStackView.bottomAnchor, constant: 40),
            goToChatButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            goToChatButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            goToChatButton.bottomAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goToChatButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}



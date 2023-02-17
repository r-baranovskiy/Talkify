import UIKit

class ProfileView: UIView {
    
    //MARK: - UI Constants
    
    private var profileContainerView = UIView()
    private (set) var sendButton = UIButton(type: .system)
    
    let profileInfoTextField = SmileTextField()
    
    private let profileImage = UIImageView(imageName: "ava1",
                                           contentMode: .scaleAspectFill,
                                           addBorder: false)
    
    private let profileNameLabel = UILabel(text: "Ruslan Kashchenko",
                                           font: .avenir40(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true,
                                           alignment: .center)
    private (set) var profileAboutLabel = UILabel(text: "I work at the factory as a worker",
                                                  font: .avenir20(),
                                                  textColor: .label,
                                                  adjustsFontSizeToFitWidth: true)
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        sendButton = profileInfoTextField.sendButton
        addSubiewWithoutAutoresizing(profileImage)
        addSubiewWithoutAutoresizing(profileContainerView)
        
        customizeElements()
        setupProfileContainer()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Config
    
    private func customizeElements() {
        profileAboutLabel.numberOfLines = 0
    }
    
    private func setupProfileContainer() {
        profileContainerView.layer.cornerRadius = 30
        profileContainerView.backgroundColor = UIColor(named: KeysColor.lightGrayBackground.rawValue)
        
        profileContainerView.addSubiewWithoutAutoresizing(profileNameLabel)
        profileContainerView.addSubiewWithoutAutoresizing(profileAboutLabel)
        profileContainerView.addSubiewWithoutAutoresizing(profileInfoTextField)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileContainerView.heightAnchor.constraint(equalToConstant: 206),
            profileContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profileImage.topAnchor.constraint(equalTo: topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant: -30),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileContainerView.topAnchor, constant: 10),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 50),
            profileNameLabel.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -50),
            
            profileAboutLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            profileAboutLabel.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 10),
            profileAboutLabel.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -10),
            
            profileInfoTextField.topAnchor.constraint(equalTo: profileAboutLabel.bottomAnchor, constant: 10),
            profileInfoTextField.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 20),
            profileInfoTextField.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -20),
            profileInfoTextField.heightAnchor.constraint(equalToConstant: 38),
            profileInfoTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}



import UIKit

class ChatRequestView: UIView {
    
    //MARK: - UI Constants
    
    private var userContainerView = UIView()
    
    private let userImage = UIImageView(imageName: "ava1",
                                           contentMode: .scaleAspectFill,
                                           addBorder: false)
    
    private let userNameLabel = UILabel(text: "Ruslan Kashchenko",
                                           font: .avenir40(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true,
                                           alignment: .center)
    private (set) var userAboutLabel = UILabel(text: "I work at the factory as a workedsfdsfdsfdsfdsfds fdsfsdfdsfdsafdsfdsfdsfdsfdsfsdr",
                                                  font: .avenir20(),
                                                  textColor: .label,
                                                  adjustsFontSizeToFitWidth: true)
    
    let acceptButton = CustomButton.createAcceptButton()
    let denyButton = CustomButton.createDenyButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewWithoutTranslates(userImage)
        addSubviewWithoutTranslates(userContainerView)
        
        customizeElements()
        setupUserContainer()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        acceptButton.applyGradients(cornerRadius: 10)
    }
    
    //MARK: - UI Config
    
    private func customizeElements() {
        userAboutLabel.numberOfLines = 0
    }
    
    private func setupUserContainer() {
        userContainerView.layer.cornerRadius = 30
        userContainerView.backgroundColor = UIColor(named: KeysColor.lightGrayBackground.rawValue)
        
        userContainerView.addSubviewWithoutTranslates(userNameLabel)
        userContainerView.addSubviewWithoutTranslates(userAboutLabel)
        userContainerView.addSubviewWithoutTranslates(acceptButton)
        userContainerView.addSubviewWithoutTranslates(denyButton)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            userContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            userImage.topAnchor.constraint(equalTo: topAnchor),
            userImage.bottomAnchor.constraint(equalTo: userContainerView.bottomAnchor, constant: -30),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: userContainerView.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor, constant: 50),
            userNameLabel.trailingAnchor.constraint(equalTo: userContainerView.trailingAnchor, constant: -50),
            
            userAboutLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userAboutLabel.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor, constant: 10),
            userAboutLabel.trailingAnchor.constraint(equalTo: userContainerView.trailingAnchor, constant: -10),
            
            acceptButton.widthAnchor.constraint(equalTo: userContainerView.widthAnchor, multiplier: 0.4),
            acceptButton.heightAnchor.constraint(equalTo: acceptButton.widthAnchor, multiplier: 0.4),
            acceptButton.topAnchor.constraint(greaterThanOrEqualTo: userAboutLabel.bottomAnchor, constant: 20),
            acceptButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            acceptButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            denyButton.heightAnchor.constraint(equalTo: acceptButton.heightAnchor),
            denyButton.widthAnchor.constraint(equalTo: acceptButton.widthAnchor),
            denyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            denyButton.topAnchor.constraint(equalTo: acceptButton.topAnchor)
        ])
    }
}



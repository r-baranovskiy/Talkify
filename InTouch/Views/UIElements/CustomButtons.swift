import UIKit

class CustomButton: UIButton {
    
    convenience init(text: String, isShadow: Bool) {
        self.init()
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont(name: "avenir", size: 30)
        self.backgroundColor = .gray
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10
        self.alpha = 0.7
        
        if isShadow {
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowRadius = 2
            self.layer.shadowOpacity = 10
            self.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
    }
    
    static func createAcceptButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("ACCEPT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .laoSangamMN20()
        button.layer.cornerRadius = 10
        
        return button
    }
    
//    static func createDenyButton() -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle("Deny", for: .normal)
//        button.setTitleColor(UIColor(named: KeysColor.denyButtonColor.rawValue), for: .normal)
//        button.backgroundColor = .white
//        button.titleLabel?.font = .laoSangamMN20()
//        button.layer.cornerRadius = 10
//        button.layer.borderWidth = 1.2
//        button.layer.borderColor = UIColor(named: KeysColor.denyButtonColor.rawValue)?.cgColor
//        return button
//    }
    
    static func createGoogleButton(_ googleButton: UIButton) {
        let googleLogo = UIImageView(image: UIImage(named: "googleLogo"))
        googleLogo.contentMode = .scaleToFill
        googleButton.alpha = 1
        googleButton.addSubviewWithoutTranslates(googleLogo)
        
        NSLayoutConstraint.activate([
            googleLogo.heightAnchor.constraint(equalTo: googleButton.heightAnchor, multiplier: 0.5),
            googleLogo.widthAnchor.constraint(equalTo: googleLogo.heightAnchor, multiplier: 1),
            googleLogo.leadingAnchor.constraint(equalTo: googleButton.leadingAnchor, constant: 15),
            googleLogo.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor)
        ])
    }
    
    static func createBackButton() -> UIButton {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: Images.backButtonImage.rawValue),
                            for: .normal)
        button.setTitle("Отменить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.tintColor = .label
        
        
        return button
    }
}

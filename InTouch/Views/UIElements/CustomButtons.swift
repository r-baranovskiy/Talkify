import UIKit

final class CustomButton {
    
    static func createNavigationButton(title: String, isShadow: Bool) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .avenir30()
        button.backgroundColor = .systemGray
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.alpha = 0.7
        
        if isShadow {
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowRadius = 2
            button.layer.shadowOpacity = 10
            button.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
        
        return button
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
    
    static func createGoogleButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Google", for: .normal)
        button.titleLabel?.font = .avenir30()
        button.backgroundColor = .systemGray
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.alpha = 1
        
        let googleLogo = UIImageView(image: UIImage(named: Images.googleLogoImage.rawValue))
        googleLogo.contentMode = .scaleToFill
        button.addSubviewWithoutTranslates(googleLogo)
        
        NSLayoutConstraint.activate([
            googleLogo.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 0.5),
            googleLogo.widthAnchor.constraint(equalTo: googleLogo.heightAnchor, multiplier: 1),
            googleLogo.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 15),
            googleLogo.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        
        return button
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

import UIKit

final class CustomButton {
    
    static func createNavButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .avenir30()
        button.setTitleColor(.label, for: .normal)
        button.alpha = 1
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
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
    
        static func createDenyButton() -> UIButton {
            let button = UIButton(type: .system)
            button.setTitle("Deny", for: .normal)
            button.setTitleColor(.systemRed, for: .normal)
            button.backgroundColor = .white
            button.titleLabel?.font = .laoSangamMN20()
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1.2
            button.layer.borderColor = UIColor.systemRed.cgColor
            return button
        }
    
    static func createGoogleButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Google", for: .normal)
        button.titleLabel?.font = .avenir30()
        button.backgroundColor = .label
        button.setTitleColor(.systemBackground, for: .normal)
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

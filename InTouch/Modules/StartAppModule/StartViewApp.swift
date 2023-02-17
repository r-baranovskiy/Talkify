import UIKit

protocol StartViewAppDelegate: AnyObject {
    func loginButtonDidTap()
    func registerButtonDidTap()
}

/// This view class that displays in StartViewController
final class StartViewApp: UIView {
    
    //MARK: - UI Constants
    
    weak var delegate: StartViewAppDelegate?
    
    private var timeIntervalAnimate = 0.5
    
    //Labels
    private let mainLabel = UILabel(
        text: "", font: .beerMoney80(),
        adjustsFontSizeToFitWidth: true, alignment: .center)
    
    private let communicatePropertyLabel = UILabel(
        text: "📨  Общайся со своими друзьями", font: .markerFelt20(),
        adjustsFontSizeToFitWidth: true)
    
    private let sharePhotosLabel = UILabel(
        text: "🏞️  Делись фото и видео", font: .markerFelt20(),
        adjustsFontSizeToFitWidth: true)
    
    private let shareLocationLabel = UILabel(
        text: "⛱️  Покажи где ты находишься", font: .markerFelt20(),
        adjustsFontSizeToFitWidth: true)
    
    private let stayInTouchLabel = UILabel(
        text: "🌝  Оставайся всегда на связи", font: .markerFelt20(),
        adjustsFontSizeToFitWidth: true)
    
    //Buttons
    private let loginButton = CustomButton(text: "Войти", isShadow: true)
    private let registerButton = CustomButton(text: "Регистрация", isShadow: true)
    
    //Containers
    private var propertyStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.CustomColor.startBackground.color
        showAnimatedMainLabel()
        configurePropertyStackView()
        configureButtonsStackView()
        setTargets()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Behaviour
    
    private func setTargets() {
        loginButton.addTarget(
            self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(
            self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonDidTap()
    }
    
    @objc private func registerButtonTapped() {
        delegate?.registerButtonDidTap()
    }
    
    //MARK: - Appearance
    
    private func addSubviews() {
        addSubviewWithoutTranslates(mainLabel)
        addSubviewWithoutTranslates(propertyStackView)
        addSubviewWithoutTranslates(buttonsStackView)
    }
    
    private func showAnimatedMainLabel() {
        let nameLabel = "In Touch"
        var charIndex = 0.0
        
        for char in nameLabel {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                self.mainLabel.text?.append(char)
            }
            charIndex += 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
            self.showAnimatedPropertiest()
        }
    }
    
    @objc private func showAnimatedPropertiest() {
        let time = timeIntervalAnimate
        UIView.animate(withDuration: time) {
            self.communicatePropertyLabel.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: time) {
                self.sharePhotosLabel.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: time) {
                    self.shareLocationLabel.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: time) {
                        self.stayInTouchLabel.alpha = 1
                    } completion: { _ in
                        UIView.animate(withDuration: time) {
                            self.registerButton.isHidden = false
                            self.loginButton.isHidden = false
                            self.registerButton.alpha = 0.7
                            self.loginButton.alpha = 0.7
                        }
                    }
                }
            }
        }
    }
    
    private func configurePropertyStackView() {
        propertyStackView = UIStackView(
            arrangedSubviews: [communicatePropertyLabel, sharePhotosLabel,
                               shareLocationLabel, stayInTouchLabel],
            axis: .vertical, spacing: 20, alignment: .leading)
        
        for property in propertyStackView.arrangedSubviews {
            property.alpha = 0
        }
    }
    
    private func configureButtonsStackView() {
        buttonsStackView = UIStackView(
            arrangedSubviews: [loginButton, registerButton],
            axis: .vertical, spacing: 20, alignment: .fill)
        
        for element in buttonsStackView.arrangedSubviews {
            element.isHidden = true
            element.alpha = 0
        }
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(
                lessThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            mainLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -40),
            
            propertyStackView.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor, constant: 50),
            propertyStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            propertyStackView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),
            
            buttonsStackView.topAnchor.constraint(
                greaterThanOrEqualTo: propertyStackView.bottomAnchor, constant: 50),
            buttonsStackView.bottomAnchor.constraint(
                lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonsStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 80),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -80),
        ])
    }
}

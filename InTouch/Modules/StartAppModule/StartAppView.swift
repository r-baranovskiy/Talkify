import UIKit

protocol StartAppViewDelegate: AnyObject {
    func loginButtonDidTap()
    func registerButtonDidTap()
    func googleButtonDidTap()
}

/// This view class that displays in StartViewController
final class StartAppView: UIView {
    
    //MARK: - UI Constants
    
    weak var delegate: StartAppViewDelegate?
    
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
    
    private let googleLabel = UILabel(text: "Войти через:", font: .avenir20())
    
    //Buttons
    private let googleButton = CustomButton.createGoogleButton()
    
    private let loginButton = CustomButton.createNavButton(title: "Вход")
    
    private let registerButton = CustomButton.createNavButton(
        title: "Регистрация")
    
    //Containers
    private var propertyStackView = UIStackView()
    private var googleButtonStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.CustomColor.mainBackground.color
        showAnimatedMainLabel()
        configurePropertyStackView()
        configureButtonsStackView()
        configureGoogleButtonStackView()
        setTargets()
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
        googleButton.addTarget(
            self, action: #selector(googleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonDidTap()
    }
    
    @objc private func registerButtonTapped() {
        delegate?.registerButtonDidTap()
    }
    
    @objc private func googleButtonTapped() {
        delegate?.googleButtonDidTap()
    }
    
    //MARK: - Appearance
    
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
                        UIView.animate(withDuration: time + 1) {
                            self.registerButton.alpha = 0.7
                            self.loginButton.alpha = 0.7
                            self.googleLabel.alpha = 1
                            self.googleButton.alpha = 1
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
    
    private func configureGoogleButtonStackView() {
        googleButtonStackView = UIStackView(
            arrangedSubviews: [googleLabel, googleButton], axis: .vertical,
            spacing: 20, alignment: .center)
        googleLabel.alpha = 0
        googleButton.alpha = 0
    }
    
    private func configureButtonsStackView() {
        buttonsStackView = UIStackView(
            arrangedSubviews: [loginButton, registerButton],
            axis: .vertical, spacing: 20, alignment: .center, distribution: .fill)
        
        for element in buttonsStackView.arrangedSubviews {
            element.alpha = 0
        }
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        addSubviewWithoutTranslates(mainLabel, propertyStackView,
                                    googleButtonStackView, buttonsStackView)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            googleButton.widthAnchor.constraint(equalToConstant: 230),
            
            mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -40),
            
            propertyStackView.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor, constant: 30),
            propertyStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20),
            propertyStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            
            googleButtonStackView.topAnchor.constraint(
                equalTo: propertyStackView.bottomAnchor, constant: 50),
            googleButtonStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 80),
            googleButtonStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -80),
            
            buttonsStackView.topAnchor.constraint(
                greaterThanOrEqualTo: googleButtonStackView.bottomAnchor, constant: 40),
            buttonsStackView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 80),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -80),
        ])
    }
}


import UIKit

final class UserRequestViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let acceptButton = CustomButton.createAcceptButton()
    private let denyButton = CustomButton.createDenyButton()
    
    private let userImageView = UIImageView(
        imageName: "img1", contentMode: .scaleAspectFill, addBorder: false)
    
    private let usernameLabel = UILabel(
        text: "Ruslan Kashchenko", font: .avenir40(),
        adjustsFontSizeToFitWidth: true, alignment: .center)
    private let userInfoLabel = UILabel(
        text: "I'm iOS developer", font: .avenir20(), numberOfLines: 1)
    
    private let userContainerView = UIView()
    private let buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainers()
        addConstraints()
    }
    
    // MARK: - Behaviour
    
    private func addTargets() {
        acceptButton.addTarget(self, action: #selector(acceptButtonDidTap),
                               for: .touchUpInside)
        denyButton.addTarget(self, action: #selector(denyButtonDidTap),
                             for: .touchUpInside)
    }
    
    @objc private func acceptButtonDidTap() {
        print("Accept")
    }
    
    @objc private func denyButtonDidTap() {
        print("Deny")
    }
    
    // MARK: - Appearance
    
    private func configureContainers() {
        userContainerView.addSubviewWithoutTranslates(
            usernameLabel, userInfoLabel, acceptButton, denyButton)
        userContainerView.layer.cornerRadius = 30
        userContainerView.backgroundColor = UIColor
            .CustomColor.collectionViewBackground.color
        
        buttonsStackView.addArrangedSubview(acceptButton)
        buttonsStackView.addArrangedSubview(denyButton)
        
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 40
        buttonsStackView.distribution = .fillEqually
    }
    
    private func addConstraints() {
        view.addSubviewWithoutTranslates(
            userImageView, userContainerView, buttonsStackView)
        
        NSLayoutConstraint.activate([
            userContainerView.heightAnchor.constraint(
                equalToConstant: 206),
            userContainerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            userContainerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            userContainerView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
            
            userImageView.topAnchor.constraint(equalTo: view.topAnchor),
            userImageView.bottomAnchor.constraint(
                equalTo: userContainerView.bottomAnchor, constant: -30),
            userImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            userImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(
                equalTo: userContainerView.topAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(
                equalTo: userContainerView.leadingAnchor, constant: 50),
            usernameLabel.trailingAnchor.constraint(
                equalTo: userContainerView.trailingAnchor, constant: -50),
            
            userInfoLabel.topAnchor.constraint(
                equalTo: usernameLabel.bottomAnchor, constant: 10),
            userInfoLabel.leadingAnchor.constraint(
                equalTo: userContainerView.leadingAnchor, constant: 10),
            userInfoLabel.trailingAnchor.constraint(
                equalTo: userContainerView.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(
                equalTo: userInfoLabel.bottomAnchor, constant: 20),
            buttonsStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStackView.leadingAnchor.constraint(
                equalTo: userContainerView.leadingAnchor, constant: 10),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: userContainerView.trailingAnchor, constant: -10)
        ])
    }
}

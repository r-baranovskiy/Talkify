import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - UI Constants
    
    private let profileInfoTextField = SmileTextField()
    
    private lazy var sendButton: UIButton = {
        var button = UIButton(type: .system)
        button = profileInfoTextField.sendButton
        return button
    }()
    
    private let profileImageView = UIImageView(
        imageName: "img1", contentMode: .scaleAspectFill, addBorder: false)
    
    private let profileNameLabel = UILabel(
        text: "Ruslan Kashchenko", font: .avenir40(),
        adjustsFontSizeToFitWidth: true, alignment: .center)
    private let profileInfoLabel = UILabel(
        text: "I'm iOS developer", font: .avenir20(), numberOfLines: 3)
    
    private let profileContainerView = UIView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.addTarget(
            self, action: #selector(sendButtonDidTap), for: .touchUpInside)
        profileContainerView.layer.cornerRadius = 30
        
        profileContainerView.backgroundColor = UIColor
            .CustomColor.collectionViewBackground.color
        
        addConstraints()
    }
    
    @objc private func sendButtonDidTap() {
        guard let text = profileInfoTextField.text,
              text != "" else { return }
        
        profileInfoLabel.text = text
    }
    
    // MARK: - Appearance
    
    private func addConstraints() {
        profileContainerView.addSubviewWithoutTranslates(
            profileNameLabel, profileInfoLabel, profileInfoTextField)
        
        view.addSubviewWithoutTranslates(profileImageView, profileContainerView)
        
        NSLayoutConstraint.activate([
            profileContainerView.heightAnchor.constraint(
                equalToConstant: 206),
            profileContainerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            profileContainerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            profileContainerView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor),
            profileImageView.bottomAnchor.constraint(
                equalTo: profileContainerView.bottomAnchor, constant: -30),
            profileImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            profileImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.topAnchor.constraint(
                equalTo: profileContainerView.topAnchor, constant: 10),
            profileNameLabel.leadingAnchor.constraint(
                equalTo: profileContainerView.leadingAnchor, constant: 50),
            profileNameLabel.trailingAnchor.constraint(
                equalTo: profileContainerView.trailingAnchor, constant: -50),
            
            profileInfoLabel.topAnchor.constraint(
                equalTo: profileNameLabel.bottomAnchor, constant: 10),
            profileInfoLabel.leadingAnchor.constraint(
                equalTo: profileContainerView.leadingAnchor, constant: 10),
            profileInfoLabel.trailingAnchor.constraint(
                equalTo: profileContainerView.trailingAnchor, constant: -10),
            
            profileInfoTextField.topAnchor.constraint(
                equalTo: profileInfoLabel.bottomAnchor, constant: 10),
            profileInfoTextField.leadingAnchor.constraint(
                equalTo: profileContainerView.leadingAnchor, constant: 20),
            profileInfoTextField.trailingAnchor.constraint(
                equalTo: profileContainerView.trailingAnchor, constant: -20),
            profileInfoTextField.heightAnchor.constraint(
                equalToConstant: 38),
            profileInfoTextField.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}



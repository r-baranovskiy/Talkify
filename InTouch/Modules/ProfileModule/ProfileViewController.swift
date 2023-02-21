import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - UIConstants
    
    private let profileView = ProfileView()
    private var infoTextField = UITextField()
    private var sendButton = UIButton()
    private var aboutInfoLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        addTargets()
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        infoTextField = profileView.profileInfoTextField
        sendButton = profileView.sendButton
        aboutInfoLabel = profileView.profileAboutLabel
    }
    
    //MARK: - Behavior
    
    private func addTargets() {
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
    }
    
    @objc private func sendButtonPressed() {
        if let text = infoTextField.text,
           text != "" {
            aboutInfoLabel.text = text
        }
    }
    
}

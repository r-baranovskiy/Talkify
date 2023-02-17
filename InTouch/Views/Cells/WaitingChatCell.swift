import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {

    static var reuseID: String = "WaitingChatCell"
    
    private let profileImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        addSubiewWithoutAutoresizing(profileImageView)
        setConstraints()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let message: Message = value as? Message else { return }
        profileImageView.image = message.userImage
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

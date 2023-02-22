import UIKit

final class ActiveChatCell: UICollectionViewCell, ConfiguringCell {

    static let reuseID: String = "ActiveChatCell"
    
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel(
        text: "Username", font: .laoSangamMN20())
    private let lastMessageLabel = UILabel(
        text: "Hoa are you?", font: .laoSangamMN18())
    
    private let gradientView = GradientView(
        from: .top, to: .bottom,
        startColor: UIColor.CustomColor.startGradientCell.color,
        endColor: UIColor.CustomColor.endGradientCell.color)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: Chat = value as? Chat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
        friendNameLabel.text = chat.username
        lastMessageLabel.text = chat.lastMessage
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        addSubviewWithoutTranslates(friendImageView, friendNameLabel,
                                    lastMessageLabel, gradientView)
        
        gradientView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            friendImageView.heightAnchor.constraint(equalTo: heightAnchor),
            friendImageView.widthAnchor.constraint(
                equalTo: friendImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.heightAnchor.constraint(equalTo: heightAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            friendNameLabel.topAnchor.constraint(
                equalTo: topAnchor, constant: 12),
            friendNameLabel.leadingAnchor.constraint(
                equalTo: friendImageView.trailingAnchor, constant: 16),
            friendNameLabel.trailingAnchor.constraint(
                equalTo: gradientView.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lastMessageLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -12),
            lastMessageLabel.leadingAnchor.constraint(
                equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(
                equalTo: gradientView.leadingAnchor, constant: -16)
        ])
    }
}



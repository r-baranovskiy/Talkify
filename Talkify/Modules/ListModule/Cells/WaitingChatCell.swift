import UIKit

final class WaitingChatCell: UICollectionViewCell, ConfiguringCell {
    
    static var reuseID: String = "WaitingChatCell"
    
    private let userImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        userImageView.contentMode = .scaleToFill
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: Chat = value as? Chat else { return }
        userImageView.image = UIImage(named: chat.userImageString)
    }
    
    private func addConstraints() {
        addSubviewWithoutTranslates(userImageView)
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor),
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

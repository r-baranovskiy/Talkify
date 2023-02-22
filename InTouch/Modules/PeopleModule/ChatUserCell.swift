import UIKit

final class ChatUserCell: UICollectionViewCell, ConfiguringCell {
    
    private let userImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .laoSangamMN20()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var containerCellView = UIView()
    
    static var reuseID: String = "ChatUserCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerCellView.backgroundColor = UIColor.CustomColor.peopleCellBackground.color
        layer.shadowColor = UIColor.CustomColor.peopleCellShadow.color.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 0, height: 4)
        addConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerCellView.layer.cornerRadius = 10
        containerCellView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: ChatUser = value as? ChatUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userNameLabel.text = user.username
    }
    
    private func addConstraints() {
        containerCellView.addSubviewWithoutTranslates(userImageView, userNameLabel)
        addSubviewWithoutTranslates(containerCellView)
        
        NSLayoutConstraint.activate([
            containerCellView.topAnchor.constraint(equalTo: topAnchor),
            containerCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerCellView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(
                equalTo: containerCellView.topAnchor),
            userImageView.leadingAnchor.constraint(
                equalTo: containerCellView.leadingAnchor),
            userImageView.trailingAnchor.constraint(
                equalTo: containerCellView.trailingAnchor),
            userImageView.heightAnchor.constraint(
                equalTo: userImageView.widthAnchor),
            
            userNameLabel.leadingAnchor.constraint(
                equalTo: containerCellView.leadingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(
                equalTo: containerCellView.trailingAnchor, constant: -8),
            userNameLabel.topAnchor.constraint(
                equalTo: userImageView.bottomAnchor),
            userNameLabel.bottomAnchor.constraint(
                equalTo: containerCellView.bottomAnchor)
        ])
    }
}

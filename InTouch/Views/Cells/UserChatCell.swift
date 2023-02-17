import UIKit

class UserChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseID: String = "UserChatCell"
    
    private let userImageView = UIImageView(imageName: "",
                                            contentMode: .scaleAspectFill,
                                            addBorder: false)
    
    private let userName = UILabel(text: "Username",
                                   font: .laoSangamMN20(),
                                   textColor: .label,
                                   adjustsFontSizeToFitWidth: false,
                                   alignment: .center)
    
    private let cellContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewWithoutTranslates(cellContainer)
        setupCellContainer()
        backgroundColor = .lightGray
        layer.cornerRadius = 3
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        contentView.clipsToBounds = true
    }
    
    private func setupCellContainer() {
        cellContainer.addSubviewWithoutTranslates(userImageView)
        cellContainer.addSubviewWithoutTranslates(userName)
        
        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: topAnchor),
            cellContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userImageView.topAnchor.constraint(equalTo: cellContainer.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: cellContainer.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 2),
            userName.bottomAnchor.constraint(equalTo: cellContainer.bottomAnchor, constant: -2),
            userName.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor, constant: 2),
            userName.trailingAnchor.constraint(equalTo: cellContainer.trailingAnchor, constant: -2),
        ])
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: ChatUser = value as? ChatUser else { return }
        userImageView.image = UIImage(named: user.avatarImageString)
        userName.text = user.username
    }
}

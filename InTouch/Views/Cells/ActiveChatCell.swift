import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    //Cell name
    static var reuseID: String = "ActiveChatCell"
    
    //MARK: - UI Constants
    
    private let contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let contactName = UILabel(text: "Nastenok",
                                      font: .laoSangamMN20(),
                                      textColor: .label,
                                      adjustsFontSizeToFitWidth: false)
    private let lastMessage = UILabel(text: "Я тебя ненавижу",
                                      font: .laoSangamMN18(),
                                      textColor: .label,
                                      adjustsFontSizeToFitWidth: false)
    
    private let gradientView = GradientView(from: .topTrailing,
                                            to: .bottomLeading,
                                            startColor: UIColor(named: KeysColor.startGradient.rawValue),
                                            endColor: UIColor(named: KeysColor.endGradient.rawValue))
    
    //Container
    private var chatStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        configureChatStackView()
        addSubviewWithoutTranslates(chatStackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Behavior
    
    func configure<U>(with value: U) where U : Hashable {
        guard let message: Message = value as? Message else { return }
        contactImageView.image = message.userImage
        contactName.text = message.username
        lastMessage.text = message.lastMessge
    }
    
    //MARK: - UI Config
    
    private func configureChatStackView() {
        let messageStackView = UIStackView(arrangedSubviews: [contactName, lastMessage],
                                           axis: .vertical,
                                           spacing: 8,
                                           alignment: .fill)
        
        chatStackView = UIStackView(arrangedSubviews: [
            contactImageView,
            messageStackView,
            gradientView
        ],
                                    axis: .horizontal,
                                    spacing: 10,
                                    alignment: .fill)
        contactImageView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            contactImageView.heightAnchor.constraint(equalToConstant: 80),
            contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chatStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            chatStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            chatStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            chatStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
}

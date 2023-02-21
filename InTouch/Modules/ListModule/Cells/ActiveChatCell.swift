import UIKit

final class ActiveChatCell: UICollectionViewCell, ConfiguringCell {
    static let reuseID: String = "ActiveChatCell"
    
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel(text: "Username", font: .laoSangamMN20())
    private let lastMessageLabel = UILabel(text: "Hoa are you?", font: .laoSangamMN18())
    
    private let gradientView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: Chat) {
        friendImageView.image = UIImage(named: value.userImageString)
        friendNameLabel.text = value.username
        lastMessageLabel.text = value.lastMessage
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
            friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.heightAnchor.constraint(equalTo: heightAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            friendNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            friendNameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendNameLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lastMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            lastMessageLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16)
        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> MainTabBarViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}



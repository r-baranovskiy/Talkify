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
    
    func configure(with value: Chat) {
        userImageView.image = UIImage(named: value.userImageString)
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

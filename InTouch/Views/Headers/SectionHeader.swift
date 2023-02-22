import UIKit

final class SectionHeader: UICollectionReusableView {
    
    static let identifier = "SectionHeader"
    
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, font: UIFont?, textColor: UIColor) {
        self.title.text = title
        self.title.font = font
        self.title.textColor = textColor
    }
    
    private func addConstraints() {
        addSubviewWithoutTranslates(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

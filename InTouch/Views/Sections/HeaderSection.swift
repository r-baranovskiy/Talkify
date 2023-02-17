import UIKit

class HeaderSection: UICollectionReusableView {
    
    static let headerID = "HeaderSection"
    
    private var headerTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewWithoutTranslates(headerTitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textHeader: String, font:UIFont?, textColor: UIColor?) {
        headerTitle.text = textHeader
        headerTitle.font = font
        headerTitle.textColor = textColor
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: topAnchor),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}

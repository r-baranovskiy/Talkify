import UIKit

extension UIStackView {
    
    convenience init(
        arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis,
        spacing: CGFloat, alignment: UIStackView.Alignment,
        distribution: UIStackView.Distribution = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
}

import UIKit

extension UILabel {
    
    convenience init(
        text: String, font: UIFont?, textColor: UIColor = .label,
        adjustsFontSizeToFitWidth: Bool = false, minimumScale: CGFloat = 0.6,
        alignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
            self.init()
            self.text = text
            self.textColor = textColor
            self.font = font
            self.textAlignment = alignment
            self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
            self.numberOfLines = numberOfLines
            
            if adjustsFontSizeToFitWidth {
                self.minimumScaleFactor = minimumScale
            }
        }
}

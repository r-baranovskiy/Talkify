import UIKit

extension UIColor {
    static func backgoundImage() -> UIColor {
        if let image = UIImage(named: KeysImages.backgroundImage.rawValue) {
            return UIColor(patternImage: image)
        }
        return .label
    }
}

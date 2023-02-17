import UIKit

extension UIColor {
    enum CustomColor {
        case startBackground
        
        var color: UIColor {
            switch self {
            case .startBackground:
                if let image = UIImage(named: "backgroundImage") {
                    return UIColor(patternImage: image)
                } else {
                    return .systemBackground
                }
            }
        }
    }
}

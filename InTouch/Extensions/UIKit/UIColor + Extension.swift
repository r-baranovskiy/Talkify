import UIKit

extension UIColor {
    enum CustomColor {
        case mainBackground
        case navigationButtonBackground
        case tabBarBackground
        case collectionViewBackground
        
        var color: UIColor {
            switch self {
            case .mainBackground:
                if let image = UIImage(named: "backgroundImage") {
                    return UIColor(patternImage: image)
                } else {
                    return .systemBackground
                }
            case .navigationButtonBackground:
                return UIColor(named: "backgroundNavigationButtonColor") ?? .secondarySystemGroupedBackground
            case .tabBarBackground:
                return UIColor(named: "tabBarColor") ?? .secondarySystemGroupedBackground
            case .collectionViewBackground:
                return UIColor(named: "collectionViewBackground") ?? .systemBackground
            }
        }
    }
}

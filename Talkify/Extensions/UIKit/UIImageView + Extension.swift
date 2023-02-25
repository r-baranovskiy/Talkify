import UIKit

extension UIImageView {
    
    convenience init(
        imageName: String, contentMode: UIView.ContentMode, addBorder: Bool) {
        self.init()
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
        self.clipsToBounds = true
        
        if addBorder {
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

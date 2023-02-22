import UIKit

final class SmileTextField: UITextField {
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "publishImageForButton"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Setup TextField
        backgroundColor = .systemBackground
        placeholder = "Напишите что-нибудь о себе"
        font = .systemFont(ofSize: 16)
        clearButtonMode = .whileEditing
        borderStyle = .none
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        //Add left image
        let leftImageView = UIImageView(image: UIImage(systemName: "smiley"))
        leftImageView.tintColor = .label
        leftView = leftImageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftViewMode = .always
        
        //Add button
        let buttonView = UIView()
        buttonView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        buttonView.backgroundColor = .clear
        sendButton.frame = buttonView.frame
        buttonView.addSubview(sendButton)
        rightView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        rightView = buttonView
        rightViewMode = .always
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 12
        return rect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

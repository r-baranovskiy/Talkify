import UIKit

class CustomTextField: UITextField {
    
    convenience init(placeholder: String,
                     keyboardType: UIKeyboardType = .default,
                     returnKeyType: UIReturnKeyType = .continue,
                     isSecure: Bool = false,
                     autocapitalization: UITextAutocapitalizationType = .none) {
        self.init()
        self.autocapitalizationType = autocapitalization
        self.autocorrectionType = .no
        self.keyboardType = keyboardType
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.textColor = .label
        self.returnKeyType = returnKeyType
        self.isSecureTextEntry = isSecure
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    static func oneLineTextField() -> UITextField {
        let textField = UITextField()
        textField.font = .avenir20()
        textField.borderStyle = .none
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = .black
        
        textField.addSubiewWithoutAutoresizing(bottomLineView)
        
        NSLayoutConstraint.activate([
            bottomLineView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLineView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        return textField
    }
}

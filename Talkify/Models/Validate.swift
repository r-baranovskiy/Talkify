import Foundation

class Validate {
    
    static func isFilled(email: String, password: String,
                         confirmPassword: String) -> Bool {
        if email.isEmpty,
           password.isEmpty,
           confirmPassword.isEmpty {
            return false
        }
        return true
    }
    
    static func isValideEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}

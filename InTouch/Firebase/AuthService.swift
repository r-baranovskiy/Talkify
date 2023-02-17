import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword else {
            completion(.failure(AuthError.unknownError))
            return
        }
        
        if password != confirmPassword {
            completion(.failure(AuthError.passwordNotMatched))
            return
        }
        
        if !Validate.isFilled(email: email, password: password, confirmPassword: confirmPassword) {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        if !Validate.isValideEmail(email) {
            completion(.failure(AuthError.invalidEmail))
        }
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = result {
                completion(.success(result.user))
            }
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        guard let email = email,
              let password = password,
              !email.isEmpty,
              !password.isEmpty else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = result {
                completion(.success(result.user))
            }
        }
    }
}

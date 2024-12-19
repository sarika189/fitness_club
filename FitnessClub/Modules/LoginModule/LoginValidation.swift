
import Foundation

struct LoginValidation{
    
    func emailValidation(with email: String) -> Bool {
        let emailRegex = "^[A_Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func passwordValidation(_ password: String) -> Bool {
        let pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*()_+=-]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: password)


    }
}

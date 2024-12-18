
import Foundation


class RegisterUserInfo: ObservableObject {
    static let shared = RegisterUserInfo()
    
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    @Published var mobileNumber: String {
        didSet {
            UserDefaults.standard.set(mobileNumber, forKey: "mobileNumber")
        }
    }
    
    @Published var password: String {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }
    
    @Published var gender: String {
        didSet {
            UserDefaults.standard.set(gender, forKey: "gender")
        }
    }
    
    private init() {
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
        self.email = UserDefaults.standard.string(forKey: "email") ?? ""
        self.mobileNumber = UserDefaults.standard.string(forKey: "mobileNumber") ?? ""
        self.password = UserDefaults.standard.string(forKey: "password") ?? ""
        self.gender = UserDefaults.standard.string(forKey: "gender") ?? ""
    }
}

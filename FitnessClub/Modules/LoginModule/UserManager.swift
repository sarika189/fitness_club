import Foundation

class UserManager {
    static let shared = UserManager()
    
    private let userDefaultsKey = "currentUser"
    
    //currentUser is a computed property that retrieves and stores the user data in UserDefaults using JSON encoding and decoding.
    var currentUser: UserInfo? {
        get {
            if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
                let decoder = JSONDecoder()
                return try? decoder.decode(UserInfo.self, from: data)
            }
            return nil
        }
        set {
            if let user = newValue {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(user) {
                    UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
                }
            } else {
                UserDefaults.standard.removeObject(forKey: userDefaultsKey)
            }
        }
    }
    
    private init() {}
    
    func saveUser(_ user: UserInfo) {
        print(user)
        currentUser = user
    }
    
    func loadUser() -> UserInfo? {
        return currentUser
    }
    
    func clearUser() {
        currentUser = nil
    }
}



import Foundation


struct LoginEntity : Encodable{
    let email, password: String
}

struct UserInfo: Codable{
    let firstName, lastName: String
}

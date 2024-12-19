import Foundation

struct UserInfo: Codable {
    var name: String
    var email: String
    var mobileNumber: String
    var password: String
    var gender: String
}

struct UserInfoModel: Encodable{
    var name: String
    var email: String
    var mobileNumber: String
    var password: String
    var gender: String
}

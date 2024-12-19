import Foundation

protocol LoginInteractorProtocol {
    func authenticateUser(with loginCredential : UserInfoModel) -> UserInfo?
}

struct LoginInteractor: LoginInteractorProtocol{ 
    
    func authenticateUser(with loginCredential: UserInfoModel) -> UserInfo? {
        let user = UserInfo(name: "Sarika", email: "sarikaselvi46@gmail.com", mobileNumber: "8951310272", password: "Infosys@2024", gender: "Female")
        // Save user
        UserManager.shared.saveUser(user)
        return user
    }
}

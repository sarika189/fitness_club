import Foundation

protocol RegisterInteractorProtocol {
    func registerNewUser(with user : UserInfoModel) -> UserInfo?
}

class RegisterInteractor: RegisterInteractorProtocol {
  
  func registerNewUser(with user : UserInfoModel) -> UserInfo?{
      let user = UserInfo(name: user.name, email: user.email, mobileNumber: user.mobileNumber, password: user.password, gender: user.gender)
      // Save user
      UserManager.shared.saveUser(user)
      return user
  }
  
}

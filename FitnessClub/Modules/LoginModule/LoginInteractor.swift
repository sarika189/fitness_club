
import Foundation

protocol LoginInteractorProtocol {
    func authenticateUser(with loginCredential : LoginEntity) -> UserInfo?
}

struct LoginInteractor: LoginInteractorProtocol{ 
    
    
    func authenticateUser(with loginCredential: LoginEntity) -> UserInfo? {
        let user = UserInfo(firstName: "", lastName: "")
        return user
    }
    
    
}

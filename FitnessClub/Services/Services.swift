
import Foundation


protocol LoginService{
    func login(using credentials: LoginEntity, completion: @escaping (Result<UserInfo, Error>) -> Void)
}


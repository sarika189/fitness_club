
import Foundation


protocol LoginServiceProtocol{
    func login(using credentials: UserInfoModel, completion: @escaping (Result<UserInfo, Error>) -> Void)
}




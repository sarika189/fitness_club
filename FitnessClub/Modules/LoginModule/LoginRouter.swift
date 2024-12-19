import Foundation

protocol LoginRouterProtocol{
    func navigateToDashboardView()
    var isLoggedIn: Bool { get set }
}

class LoginRouter: LoginRouterProtocol, ObservableObject{
    
    @Published
    var isLoggedIn: Bool = false
    
    func navigateToDashboardView(){
        isLoggedIn = true
      
    }
    
}

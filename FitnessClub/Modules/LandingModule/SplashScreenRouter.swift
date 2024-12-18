
import Foundation

class SplashScreenRouter{
    
    init() {}
    
    func navigateToLoginView() -> LoginView{
        let router = LoginRouter()
        return LoginView(router: router)
        
    }
    
    func navigateToRegisterView() -> RegisterView{
        
        return RegisterView()
    }
}

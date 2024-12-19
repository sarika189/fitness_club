
import Foundation

class SplashScreenRouter{
    
    init() {}
    
    func navigateToLoginView() -> LoginView{
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(loginInteractor: interactor, loginRouter: router)
        return LoginView(loginPresenter: presenter, loginRouter: router)
        
    }
    
    func navigateToRegisterView() -> RegisterView{
        let router = RegisterRouter()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        return RegisterView(presenter: presenter, router: router)
    }
}

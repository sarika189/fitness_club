import Foundation

protocol LoginPresenterProtocol: ObservableObject{
    var email: String{get set}
    var password: String{get set}
    var errorMessage: String? {get set}
    func login()
}

class LoginPresenter: LoginPresenterProtocol{
    
    @Published
    var email: String = ""
    
    @Published
    var password: String = ""
    
    @Published
    var errorMessage: String? = nil
    
    private let loginInteractor: LoginInteractorProtocol
    private let loginRouter: LoginRouterProtocol
    private let loginValidation : LoginValidation
    
    init(loginInteractor: LoginInteractorProtocol, loginRouter: LoginRouterProtocol, loginValidation: LoginValidation = .init()) {
        self.loginInteractor = loginInteractor
        self.loginRouter = loginRouter
        self.loginValidation = loginValidation
    }
    
    func login() {
        
        if let emailErrorMessage = validateEmail(with: email)  {
            errorMessage = emailErrorMessage
            return
        }
        
        if let passwordErrorMessage = validatePassword(with: password) {
            errorMessage = passwordErrorMessage
            return
        }
        
        //clear out error message
        errorMessage = nil
        
        let credential = UserInfoModel(name: "", email: email, mobileNumber: "", password: password, gender: "")
        
        if email == "sarikaselvi46@gmail.com" && password == "Infosys@2024" {
            let userInfo = loginInteractor.authenticateUser(with: credential)
            if let _ = userInfo  {
                loginRouter.navigateToDashboardView()
            }
        }else{
            errorMessage = "Invalid Credentials"
            return
        }
       
    }
    
    private func validateEmail(with email: String) -> String? {
        if !loginValidation.emailValidation(with: email) {
            let error =  "Please enter valid email address"
            return error
        }else {
            return nil
        }
    }
    
    private func validatePassword(with password: String) -> String? {
        if !loginValidation.passwordValidation(password) {
            return "Password must be at-least 8 characters long and match up with standard set."
        } else {
            return nil
        }
    }
}

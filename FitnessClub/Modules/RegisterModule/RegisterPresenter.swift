import Foundation

protocol RegisterPresenterProtocol: ObservableObject {
    var name: String { get set }
    var email: String { get set }
    var mobileNumber: String { get set }
    var password: String { get set }
    var gender: Gender { get set }
    var isTermsAndConditionsChecked: Bool { get set }
    var error: String? { get set }
    func completeRegistration()
}

class RegisterPresenter: RegisterPresenterProtocol {
    
    
    @Published
    var name: String = ""
    
    @Published
    var email: String = ""
    
    @Published
    var mobileNumber: String = ""
    
    @Published
    var gender: Gender = .Male
    
    @Published
    var password: String = ""
    
    @Published
    var error: String?
    
    @Published
    var isTermsAndConditionsChecked: Bool = false
    
    private var interactor: RegisterInteractorProtocol
    private var validation: LoginValidation
    private var router: RegisterRouter
    
    init(interactor: RegisterInteractorProtocol, validation: LoginValidation = .init(), router: RegisterRouter) {
        self.interactor = interactor
        self.validation = validation
        self.router = router
    }
    
    func completeRegistration() {
        
        if name == "" || email == "" || mobileNumber == "" || password == ""{
            error = "Please enter all the details"
            return
        }
        if !validation.emailValidation(with: email) {
            error = "Please enter a valid email address"
            return
        }
        if checkTermsAndConditions() {
            let user = UserInfoModel(name: name, email: email, mobileNumber: mobileNumber, password: password, gender: gender.rawValue)
            let userInfo = interactor.registerNewUser(with : user)
            if let _ = userInfo {
                router.isRegistrationComplete = true
            }
        }
    }
    
    private func checkTermsAndConditions() -> Bool {
        if isTermsAndConditionsChecked {
            resetError()
            return true
        } else {
            error = "Please acknowledge terms & conditions."
            return false
        }
    }
    
    private func resetError() {
        error = nil
    }
}

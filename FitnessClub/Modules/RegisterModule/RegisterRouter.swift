import Foundation

protocol RegisterRouterProtocol {
  func navigateToDashboardView() -> DashboardView
}

class RegisterRouter: RegisterRouterProtocol, ObservableObject {
  
  @Published
  var isRegistrationComplete: Bool = false
  
  func navigateToDashboardView() -> DashboardView {
    return DashboardView()
  }
  
}

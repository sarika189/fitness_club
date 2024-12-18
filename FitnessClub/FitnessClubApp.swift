import SwiftUI

@main
struct FitnessClubApp: App {
    var body: some Scene {
        WindowGroup {
            let router = SplashScreenRouter()
            NavigationStack{
                SplashScreenView(router: router)
            }
        }
    }
}

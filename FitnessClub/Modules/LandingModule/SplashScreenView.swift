import SwiftUI

struct SplashScreenView: View {
    
    private var router = SplashScreenRouter()
    
    init(router: SplashScreenRouter){
        self.router = .init()
    }
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing) .edgesIgnoringSafeArea(.all)
            // Image and button
            VStack {
                Image("fitnessLogo")
                    .resizable()
                    .cornerRadius(150)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 50)
                NavigationLink(destination: { router.navigateToLoginView() }) {
                    Text(" GET STARTED ")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .foregroundColor(.purple)
                        .padding(.top, 20)
                }
                
                HStack{
                    Text("Don't have account ?")
                        .foregroundColor(.white)
                    NavigationLink(destination: { router.navigateToRegisterView() }) {
                        Text(" Click here to Register")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .underline()
                    }
                }
                .padding(.top, 20)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(router: .init())
    }
}

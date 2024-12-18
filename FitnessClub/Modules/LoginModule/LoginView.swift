

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    private var router = LoginRouter()
    init(router: LoginRouter){
        self.router = .init()
    }
    
    var body: some View {
        VStack {
            Text("LOGIN")
                .fontWeight(.bold)
                .padding(.bottom , 50)
                .padding(.top, 50)
            
            // Email field
            TextField("Email", text: $email) .padding() .background(Color(.systemGray6)) .cornerRadius(10)
                .overlay( RoundedRectangle(cornerRadius: 10) .stroke(Color.purple, lineWidth: 1.5) )
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            // Password field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .overlay( RoundedRectangle(cornerRadius: 10) .stroke(Color.purple, lineWidth: 1.5) )
                .padding()
            // Forgot Password button
            HStack {
                Spacer()
                Button(action: {
                    print("Forgot Password tapped") }) { Text("Forgot Password?") .foregroundColor(.white)
                            .fontWeight(.bold)
                    } } .padding()
            // Login button
            NavigationLink(destination: { router.navigateToDashboardView() }) {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding()
            }
            
            
            // Terms and conditions text
            Text("By logging in, you agree to our Terms and Conditions.") .font(.footnote)
                .padding(.bottom, 30)
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 10)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(router: .init())
    }
}

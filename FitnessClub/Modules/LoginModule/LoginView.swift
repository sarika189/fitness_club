import Foundation
import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var loginPresenter: LoginPresenter
    
    @ObservedObject
    var loginRouter: LoginRouter
    
    @Environment(\.dismiss)
    var dismiss
    
    public init(loginPresenter: LoginPresenter, loginRouter: LoginRouter){
        self.loginPresenter = loginPresenter
        self.loginRouter = loginRouter
    }
    
    private var isErrorPresented: Binding<Bool>{
        Binding(get: { loginPresenter.errorMessage != nil},
                set: { if !$0 { loginPresenter.errorMessage = nil}})
    }
    
    var body: some View {
        ZStack{
            VStack {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .padding()
                Group {
                    VStack(spacing: 20) {
                        CustomTextfield(text: $loginPresenter.email,
                                        title: "Email", isSecureTextField: false)
                        
                        CustomTextfield(text: $loginPresenter.password,
                                        title: "Password",
                                        isSecureTextField: true)
                    }
                }.padding([.leading, .trailing])
                Button(action: {
                    loginPresenter.login() }) {
                        Text("Login")
                            .customTextStyle()
                    }.padding()
                    .errorAlert(errorMessage: loginPresenter.errorMessage ?? "", isErrorPresented: isErrorPresented)
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 10)
            .padding()
            .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $loginRouter.isLoggedIn, destination: {DashboardView()})
     
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(loginInteractor: interactor, loginRouter: router)
        LoginView(loginPresenter: presenter, loginRouter: router)
    }
}

//Custom Text Style Modifier
struct CustomTextModifier: ViewModifier{
    private let tintColor: Color
    private let textColor: Color
    
    init(tintColor: Color, textColor: Color) {
        self.tintColor = tintColor
        self.textColor = textColor
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.size.width * 0.40)
            .tint(textColor)
            .font(.system(size: 20))
            .padding(5)
            .background(tintColor)
            .cornerRadius(5)
    }
}

extension View{
    func customTextStyle(tintColor: Color = .white, textColor: Color = .black) -> some View{
        self.modifier(CustomTextModifier(tintColor: tintColor, textColor: textColor))
    }
}

//Custom Button
struct CustomButton: View{
    private let action: () -> AnyView
    private let title: String
    
    init(action: @escaping () -> AnyView, title: String){
        self.action = action
        self.title = title
    }
    
    var body: some View{
        NavigationLink(destination: { action()}) {
            Text(title)
                .customTextStyle()
        }
    }
}

//Custom Text Field
struct CustomTextfield: View{
    
    private let text: Binding<String>
    private let title: String
    private let isSecureTextField: Bool
    
    init(text: Binding<String>, title: String, isSecureTextField: Bool ) {
        self.text = text
        self.title = title
        self.isSecureTextField = isSecureTextField
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.semibold)
            Group{
                if isSecureTextField {
//                    SecureField("", text: text)
                    SecureTextField(text: text, title: "Password", isPasswordVisible: false)
                }else{
                    TextField("", text: text).autocapitalization(.none)
                }
            }
            .frame(height: 45)
            .padding(.horizontal, 8)
            .background(Color.white)
            .cornerRadius(10)
            .border(Color.black, width: 0.5)
        }
    }
}

struct SecureTextField: View{
    
    private let text:  Binding<String>
    @State var isPasswordVisible : Bool
    
    init(text: Binding<String>, title: String, isPasswordVisible: Bool ) {
        self.text = text
        self.isPasswordVisible = isPasswordVisible
    }
    
    var body: some View{
        ZStack(alignment: .trailing) {
            Group {
                if isPasswordVisible {
                    TextField("", text: text)
                } else {
                    SecureField("", text: text)
                }
            }
           
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

//Error Alert
struct ErrorAlert: ViewModifier{
    
    private let isPresented: Binding<Bool>
    private let errorMessage: String
    
    init(isPresented: Binding<Bool>, errorMessage: String) {
        self.isPresented = isPresented
        self.errorMessage = errorMessage
    }
    
    func body(content: Content) -> some View {
        content.alert(isPresented: isPresented) {
            Alert(title: Text("Error"),
                  message: Text(errorMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

extension View {
    func errorAlert(errorMessage: String, isErrorPresented: Binding<Bool>) -> some View {
        self.modifier(ErrorAlert(isPresented: isErrorPresented,
                                 errorMessage: errorMessage))
    }
}

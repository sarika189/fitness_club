import Foundation
import SwiftUI

struct RegisterView: View {
    @ObservedObject
    var presenter: RegisterPresenter
    
    @ObservedObject
    var router: RegisterRouter
    
    init(presenter: RegisterPresenter, router: RegisterRouter) {
        self.presenter = presenter
        self.router = router
    }
    
    var body: some View {
        VStack {
            Text("Register an Account").fontWeight(.bold)
            ScrollView {
                VStack(spacing: 15) {
                    RegisterTextField(name: $presenter.name,
                                      title: "Name")
                    RegisterTextField(name: $presenter.email,
                                      title: "Email").autocapitalization(.none)
                    RegisterTextField(name: $presenter.mobileNumber,
                                      title: "Mobile Number").keyboardType(.numberPad)
                    RegisterTextField(name: $presenter.password,
                                      title: "Create Password",
                                      isSecureField: true)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Gender").font(.title3)
                        Picker("Gender", selection: $presenter.gender) {
                            ForEach(Gender.allCases, id: \.self) { gender in
                                Text(gender.rawValue).bold()
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.top, 10)
                        .frame(height: 35)
                    }
                    HStack {
                        SquareCheckmarkButton(isChecked: $presenter.isTermsAndConditionsChecked)
                        Text("I agree with terms & conditions")
                            .fontWeight(.light)
                        Spacer()
                    }
                    .padding()
                    Button(action: { presenter.completeRegistration() }) {
                        Text("REGISTER")
                            .customTextStyle(tintColor: .customPurple,
                                             textColor: .white)
                    }
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .navigationDestination(isPresented: $router.isRegistrationComplete,
                               destination: {
            router.navigateToDashboardView()
        })
        .errorAlert(errorMessage: presenter.error ?? "",
                    isErrorPresented: isErrorPresented)
        .padding([.leading, .trailing])
    }
    
    private var isErrorPresented: Binding<Bool> {
        Binding(get: { presenter.error != nil},
                set: { if !$0 { presenter.error = nil }})
    }
}

struct SquareCheckmarkButton: View {
    
    private var isChecked: Binding<Bool>
    
    init(isChecked: Binding<Bool>) {
        self.isChecked = isChecked
    }
    
    var body: some View {
        Button(action: {
            isChecked.wrappedValue.toggle()
        }) {
            ZStack {
                // Square background
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isChecked.wrappedValue ? Color.green : Color.gray, lineWidth: 2)
                    .frame(width: 25, height: 25)
                    .background(isChecked.wrappedValue ? Color.blue : Color.clear)
                    .cornerRadius(4)
                // Checkmark
                if isChecked.wrappedValue {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
            }
        }
        .buttonStyle(.plain)
    }
}


struct RegisterTextField: View {
    
    private let name: Binding<String>
    private let title: String
    private let isSecureField: Bool
    
    init(name: Binding<String>, title: String, isSecureField: Bool = false) {
        self.name = name
        self.title = title
        self.isSecureField = isSecureField
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.title3)
            Group {
                if isSecureField {
                    SecureTextField(text: name, title: "Create Password", isPasswordVisible: false)
                } else {
                    TextField(title, text: name)
                }
            }
            .font(.title3)
            .frame(height: 40)
            Capsule()
                .foregroundColor(.black.opacity(0.3))
                .frame(height: 2)
            
        }
    }
}

enum Gender : String, CaseIterable{
    case Male
    case Female
    case Other
}

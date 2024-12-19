import SwiftUI

struct RegisterView: View {
    @State private var isPasswordVisible = false
    let genders = ["Male", "Female", "Other"]
    
    var body: some View {
        Text("")
//        VStack(spacing: 20) {
//            Text("REGISTER")
//                .fontWeight(.bold)
//                .padding(.top, 30)
//            // Name field
//            TextField("Name", text: $userInfo.name)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.purple, lineWidth: 1)
//                )
//
//            // Email field
//            TextField("Email", text: $userInfo.email)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.purple, lineWidth: 1)
//                )
//                .autocapitalization(.none)
//                .keyboardType(.emailAddress)
//
//            // Mobile number field
//            TextField("Mobile Number", text: $userInfo.mobileNumber)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.purple, lineWidth: 1)
//                )
//                .keyboardType(.phonePad)
//
//            // Password field with hide/unhide toggle
//            ZStack(alignment: .trailing) {
//                Group {
//                    if isPasswordVisible {
//                        TextField("Password", text: $userInfo.password)
//                    } else {
//                        SecureField("Password", text: $userInfo.password)
//                    }
//                }
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.purple, lineWidth: 1)
//                )
//
//                Button(action: {
//                    isPasswordVisible.toggle()
//                }) {
//                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
//                        .foregroundColor(.gray)
//                        .padding()
//                }
//            }
//
//            // Gender field
//            Picker("Gender", selection: $userInfo.gender) {
//                ForEach(genders, id: \.self) {
//                    Text($0)
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding(.top, 10)
//
//            // Register button
//            Button(action: {
//                print("Register tapped")
//                // Additional registration logic
//            }) {
//                Text("Register")
//                    .fontWeight(.bold)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
//            }
//            .padding(.top, 20)
//            .padding(.bottom, 40)
//        }
//        .padding()
//        .background(
//            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
//                .cornerRadius(20)
//                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 10)
//        )
//
//        .padding()
      
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


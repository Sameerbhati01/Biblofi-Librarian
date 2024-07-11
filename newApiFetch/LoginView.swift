import SwiftUI
import FirebaseAuth

@MainActor
final class LoginPageViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    // State properties for validation
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    
    init() {
        // Initialize with any necessary setup
        validateEmail()
        validatePassword()
    }
    
    func signIn(isLoggedIn: Binding<Bool>) {
        guard emailError.isEmpty, passwordError.isEmpty else {
            alertMessage = "Please correct the errors"
            showAlert = true
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.loginUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                UserDefaults.standard.set(true, forKey: "isUserSignedIn")
                isLoggedIn.wrappedValue = true
            } catch {
                alertMessage = "Error: \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
    
     func validateEmail() {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}(|edu.in)$"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let allowedDomains = ["gmail.com", "yahoo.com", "outlook.com", "icloud.com", "hotmail.com", "aol.com"]
        
        if email.isEmpty {
            emailError = ""
        } else if !emailPredicate.evaluate(with: email) {
            emailError = "Please enter valid email"
        } else if let domain = email.split(separator: "@").last, !allowedDomains.contains(String(domain)) {
            emailError = "Email must be from a valid provider"
        } else {
            // Check if email is already in use (if needed)
            emailError = ""
        }
    }
    
     func validatePassword() {
       if password.isEmpty {
            passwordError = "password must not be empty"
       } else if password.count > 6 {
            passwordError = "password must 6 characters long!"
       } else {
           passwordError = ""
       }
    }
}

import SwiftUI

struct LoginView: View {
    @StateObject private var loginPageViewModel = LoginPageViewModel()
    
    @EnvironmentObject var loginModel: LoginViewModel
    
    var body: some View {
        ZStack {
            Color(hex: "F7EEEB")
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack {
                    Spacer()
                    Image("MainLogin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 50)
                    Spacer()
                }
//                .frame(width: UIScreen.main.bounds.width / 2)
//                Divider()
//                    .overlay(Color(hex: "5D4037"))
                
                VStack(spacing: 20) {
                    Image("BibloFi")
//                        .padding(.top, 40)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                    Text("BibloFi")
                        .frame(width: 100,height: 40)
                        .font(.custom("Avenir Next", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "5D4037"))
                    Text("Welcome")
                        .frame(width: 300)
                        .font(.custom("Avenir Next", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "5D4037"))
                        .padding(10)// Primary Text Color
                    
                    Text("Please login to your account")
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(Color(hex: "8D6E63")) // Secondary Text Color
                    
                    TextField("Email address", text: $loginPageViewModel.email)
                        .font(.custom("Avenir Next", size: 18))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(.horizontal, 40)
                        .onChange(of: loginPageViewModel.email) { _, newValue in
                            loginPageViewModel.validateEmail()
                        }
                    
                    if !loginPageViewModel.emailError.isEmpty {
                        Text(loginPageViewModel.emailError)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 40)
                    }
                    
                    SecureField("Password", text: $loginPageViewModel.password)
                        .font(.custom("Avenir Next", size: 18))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 40)
                        .onChange(of: loginPageViewModel.password) { _, newValue in
                            loginPageViewModel.validatePassword()
                        }
                    
                    if !loginPageViewModel.passwordError.isEmpty {
                        Text(loginPageViewModel.passwordError)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.horizontal, 40)
                    }
                    
                    Button(action: {
                        loginPageViewModel.signIn(isLoggedIn: $loginModel.isLoggedIn)
                    }) {
                        Text("Login")
                            .font(.custom("Avenir Next", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "9E6028")) // Button Color
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width / 2)
            }
        }
        .alert(isPresented: $loginPageViewModel.showAlert) {
            Alert(
                title: Text("Sign-In Error"),
                message: Text(loginPageViewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}

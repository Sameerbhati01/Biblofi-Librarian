import SwiftUI
import FirebaseAuth


@MainActor
final class LoginPageViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    func signIn(isLoggedIn: Binding<Bool>) {
        guard isValidEmail(email), isValidPassword(password) else {
            alertMessage = "Email or password is not valid!"
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
}
struct LoginView: View {
    @StateObject private var loginPageViewModel = LoginPageViewModel()
    @State private var isLoggedIn = false
    
    var body: some View {
        ZStack {
            Color(hex: "FDF5E6")
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack {
                    Spacer()
                    Image("booksIllustration")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, 50)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width / 2)
                Divider()
                    .overlay(Color(hex: "5D4037"))
                
                VStack(spacing: 20) {
                    Image("owlLogo")
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
                    
                    SecureField("Password", text: $loginPageViewModel.password)
                        .font(.custom("Avenir Next", size: 18))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        loginPageViewModel.signIn(isLoggedIn: $isLoggedIn)
                    }) {
                        Text("Login")
                            .font(.custom("Avenir Next", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "A0522D")) // Button Color
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }.fullScreenCover(isPresented: $isLoggedIn, content: {
                        DashboardView()
                    })
                    
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

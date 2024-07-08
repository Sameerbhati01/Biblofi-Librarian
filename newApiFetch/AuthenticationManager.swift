//
//  AuthenticationManager.swift
//  newApiFetch
//
//  Created by Vineet Chaudhary on 08/07/24.
//

import FirebaseAuth
import FirebaseFirestore

class AuthenticationManager {
    static let shared = AuthenticationManager()
    private let db = Firestore.firestore()

    private init() {}

    func loginUser(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        setLoggedIn()
        return authResult.user
    }

    func createUser(email: String, password: String, fullName: String, phoneNumber: String) async throws -> User {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let user = authResult.user
        
        // Store additional user data in Firestore
        try await db.collection("users").document(user.uid).setData([
            "fullName": fullName,
            "email": email,
            "phoneNumber": phoneNumber
        ])
        
        setLoggedIn()
        return user
    }

    func logoutUser() throws {
        try Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }

    private func setLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
}

//
//  Global.swift
//  newApiFetch
//
//  Created by Akshat Kamboj on 08/07/24.
//

import Foundation
import FirebaseAuth


func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func isValidPassword(_ password: String) -> Bool {
    return password.count >= 6
}

func isCurrentlyAdmin() -> Bool {
    return Auth.auth().currentUser?.email == "admin@admin.com"
}


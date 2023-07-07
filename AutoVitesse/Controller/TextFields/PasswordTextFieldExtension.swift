//
//  PasswordTextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation

extension PasswordTextField {
    func handlePasswordChange(_ password: String) {
        let passwordRegex =
        "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\\$%^&*()_+\\-\\]\\[{};:'\"\\|\\\\,.<>\\/?]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValidPassword = passwordPredicate.evaluate(with: password)
        if !isValidPassword {
            errorMessage =
            "The password must contain at least 8 characters, 1 upper, 1 lower, 1 number, 1 special char."
            isPasswordCompleted = false
        } else {
            errorMessage = ""
            isPasswordCompleted = true
        }
    }
}

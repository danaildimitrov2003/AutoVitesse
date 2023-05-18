//
//  EmailTextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation

extension EmailTextField{
    
    func handleEmailChange(_ email: String){
        let emailRegex = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        let isValidEmail =  emailPredicate.evaluate(with: email)
        if !isValidEmail {
            errorMessage = "Please enter a valid email!"
            isEmailCompleted = false
        }else{
            errorMessage = ""
            isEmailCompleted = true
        }
    }
    
}

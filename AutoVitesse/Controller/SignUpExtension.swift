//
//  SignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation

extension SignUpFormView {
    
    func signUp (){
        user.username = username
        user.email = email
        user.password = password
        user.country = country
        user.city = city
        try? realm.write {
            realm.add(user)
        }
        dismiss()
    }
    
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
    
    func handlePasswordChange(_ password: String){
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\\$%^&*()_+\\-\\]\\[{};:'\"\\|\\\\,.<>\\/?]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValidPassword = passwordPredicate.evaluate(with: password)
        if !isValidPassword {
            errorMessage = "The password must contain at least 8 characters, 1 upper, 1 lower, 1 number, 1 special char."
            isPasswordCompleted = false
        }else{
            errorMessage = ""
            isPasswordCompleted = true
        }
    }
    
    func handleConfirmPasswordChange(_ password: String, _ confirmPassword : String){
        if(password != confirmPassword){
            errorMessage = "The passwords don't match!"
            isConfirmPasswordCompleted = false
        }else{
            errorMessage = ""
            isConfirmPasswordCompleted = true
        }
    }
    
    func handleSubmitButton(){
        let userData = [username, country]
        let confirmationData = [isEmailCompleted, isPasswordCompleted, isConfirmPasswordCompleted, isEmailConfirmed]
        var isFormCompleted = true
        
        for data in confirmationData {
            if(data == false){
                errorMessage = "Please fill out the form!"
                isFormCompleted = false
                break
            }
        }
        for data in userData {
            if(data == ""){
                errorMessage = "Please fill out the form!"
                isFormCompleted = false
                break
            }
        }
        if(isFormCompleted){
            errorMessage = ""
            signUp()
        }
       
    }
}

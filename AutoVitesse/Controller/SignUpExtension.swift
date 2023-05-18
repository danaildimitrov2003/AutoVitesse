//
//  SignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation

extension SignUpFormView {
    
    func signUp (){
        let hashPassword = GlobalFuncs()
        user.username = username
        user.email = email
        user.password = hashPassword.hashPassword(password)
        user.country = country
        user.city = city
        try? realm.write {
            realm.add(user)
        }
        appSession.currentUser = user
    }
    
    
    func handleSubmitButton(){
        let userData = [country]
        let confirmationData = [isUsernameCompleted, isEmailCompleted, isPasswordCompleted, isConfirmPasswordCompleted, isEmailConfirmed]
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
            showHomeView = true
        }
        
    }
}

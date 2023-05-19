//
//  SignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation

extension SignUpFormView {
    
    func signUp (){
        let utils = Utils()
        user.username = username
        user.email = email
        user.password = utils.hashString(password)
        user.country = country
        user.city = city
        try? realm.write {
            realm.add(user)
        }
        appSession.currentUser = user
    }
    
    
    func handleSubmitButton(){
        let utils = Utils()
        let userData = [country]
        let completionData = [isUsernameCompleted, isEmailCompleted, isPasswordCompleted, isConfirmPasswordCompleted, isEmailConfirmed]
        var isFormCompleted = true
        isFormCompleted = utils.checkBools(completionData)
        for data in userData {
            if(data == ""){
                isFormCompleted = false
                break
            }
        }
        if(isFormCompleted){
            errorMessage = ""
            signUp()
            showHomeView = true
        }else{
            errorMessage = "Please fill out the form!"
        }
        
    }
}

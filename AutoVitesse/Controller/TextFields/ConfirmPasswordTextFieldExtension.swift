//
//  ConfirmPasswordTextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation

extension ConfirmPasswordTextField{
    func handleConfirmPasswordChange(_ password: String, _ confirmPassword : String){
        if(password != confirmPassword){
            errorMessage = "The passwords don't match!"
            isConfirmPasswordCompleted = false
        }else{
            errorMessage = ""
            isConfirmPasswordCompleted = true
        }
    }
}

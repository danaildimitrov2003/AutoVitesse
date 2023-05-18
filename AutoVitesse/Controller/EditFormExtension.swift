//
//  EditFormExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import Foundation
import RealmSwift

extension EditForm{
    
    func handleSaveButton(){
        let confirmationData = [isEmailCompleted, isPasswordCompleted]
        var isFormCompleted = true
        
        for data in confirmationData {
            if(data == false){
                errorMessage = "Please fill out the form!"
                isFormCompleted = false
                break
            }
        }
        if(isFormCompleted){
            errorMessage = ""
            saveUserEdit()
            showHomeView = true
        }
    }
    
    func saveUserEdit(){
        do{
            let hashPassword = GlobalFuncs()
            let realm = try Realm()
            guard let user = appSession.currentUser else {
                print("User not found")
                return
            }
            try realm.write {
                user.thaw()?.email = userEdit.email
                if(userEdit.password != ""){
                    user.thaw()?.password = hashPassword.hashPassword(userEdit.password)
                }
                user.thaw()?.country = userEdit.country
                user.thaw()?.city = userEdit.city
            }
            appSession.currentUser = user
        }
        catch{
            print("Error updating user: \(error)")
        }
    }
    
}

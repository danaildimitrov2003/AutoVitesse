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
        let utils = Utils()
        let completionData = [isEmailCompleted, isPasswordCompleted]
        if(utils.checkBools(completionData)){
            errorMessage = ""
            saveUserEdit()
            presentationMode.wrappedValue.dismiss()
        }else{
            errorMessage = "Please fill out the form!"
        }
    }
    
    func saveUserEdit(){
        do{
            let utils = Utils()
            let realm = try Realm()
            let user = utils.getCurrentUser()
            try realm.write {
                user.thaw()?.email = userEdit.email
                if(userEdit.password != ""){
                    user.thaw()?.password = utils.hashString(userEdit.password)
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

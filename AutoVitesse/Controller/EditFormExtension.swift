//
//  EditFormExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import Foundation
import RealmSwift

extension EditForm{
    
    func saveUserEdit(){
        do{
            let realm = try Realm()
            guard let user = appSession.currentUser else {
                print("User not found")
                return
            }
            try realm.write {
                user.email = userEdit.email
                user.password = userEdit.password
                user.country = userEdit.country
                user.city = userEdit.city
            }
            showHomeView = true
        }
        catch{
            print("Error updating user: \(error)")
        }
    }
    
}

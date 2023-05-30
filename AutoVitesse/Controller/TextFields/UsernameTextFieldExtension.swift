//
//  UsernameTextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation
import RealmSwift

extension UsernameTextField{
    
    func handleUsernameChange(_ username: String ){
        do{
            let realm = try Realm(configuration: config)
            if (realm.objects(User.self).filter("username = %@", username).first != nil ) {
                errorMessage = "This username has been taken!"
                isUsernameCompleted = false
            }else{
                isUsernameCompleted = true
                errorMessage = ""
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
        
        
    }
}

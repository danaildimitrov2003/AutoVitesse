//
//  SignInExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 15.05.23.
//

import Foundation
import RealmSwift

extension SignInFormView {
    
    func signIn (username: String, password: String){
        let utils = Utils()
        do{
            let realm = try Realm(configuration: config)
            print(Realm.Configuration.defaultConfiguration.fileURL)
            if let user = realm.objects(User.self).filter("username = %@ AND password = %@", username, utils.hashString(password)).first {
                appSession.currentUser = user
                showHomeView = true
            }else{
                errorMessage = "Didn't find this username and password combination!"
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
    }
}

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
        let realm = try! Realm()
        if let user = realm.objects(User.self).filter("username = %@ AND password = %@", username, password).first {
            appSession.currentUser = user
        }else{
            errorMessage = "Didn't find this username and password combination!"
        }
    }
}

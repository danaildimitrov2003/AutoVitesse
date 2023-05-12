//
//  Authentication.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation
import RealmSwift


func RealmRegister(){
    let client = app.emailPasswordAuth
    let email = "test@test.com"
    let password = "123456"
    client.registerUser(email: email, password: password) { (error) in
        guard error == nil else {
            print("Failed to register: \(error!.localizedDescription)")
            //e = "Failed to register: \(error!.localizedDescription)"
            return
        }
        print("Successfully registered user.")
    }
}



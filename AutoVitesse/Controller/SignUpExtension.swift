//
//  SignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation

extension SignUpFormView {
   
    func signUp (username: String, email: String, password: String, country: String, city: String){
        user.username = username
        user.email = email
        user.password = password
        user.country = country
        user.city = city
        try? realm.write {
            realm.add(user)
        }
        dismiss() 
    }
}

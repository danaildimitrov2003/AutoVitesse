//
//  ProfileViewExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import Foundation

extension ProfileView{
    
    func setEditUser() -> User{
        let userEdit = User()
        
        userEdit.username = user[0].username
        userEdit.email = user[0].email
        userEdit.password = ""
        userEdit.country = user[0].country
        userEdit.city = user[0].city
        
        return userEdit
    }
}

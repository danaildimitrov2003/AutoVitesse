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
        
        userEdit.username = user!.username
        userEdit.email = user!.email
        userEdit.password = ""
        userEdit.country = user!.country
        userEdit.city = user!.city
        
        return userEdit
    }
}

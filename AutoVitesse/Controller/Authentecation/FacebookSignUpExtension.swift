//
//  FacebookSignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 7.06.23.
//

import Foundation
import RealmSwift

extension FacebookSignUpView {
    func handleSignUpButton() {
        let utils = Utils()
        let completionData = [isUsernameCompleted]
        let userData = [country]
        var isFormCompleted = true
        isFormCompleted = utils.checkBools(completionData)
        for data in userData where data == "" {
            isFormCompleted = false
            break
        }
        if isFormCompleted {
            errorMessage = ""
            saveUser()
            showHomeView = true
        } else {
            errorMessage = "Please fill out the form!"
        }
    }
    func saveUser() {
        let utils = Utils()
        do {
            let realm = try Realm(configuration: config)
            let user = utils.getCurrentUser()
            user.email = email
            user.username = username
            user.country = country
            user.city = city
            realm.safeWrite {
                realm.add(user)
            }
            appSession.currentUser = user
        } catch {
            print("Error updating user: \(error)")
        }
    }
}

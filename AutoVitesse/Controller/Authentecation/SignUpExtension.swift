//
//  SignUpExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.05.23.
//

import Foundation
import RealmSwift

extension SignUpFormView {
    func signUp () {
        let utils = Utils()
        do {
            let user = User()
            user.username = username
            user.email = email
            user.password = utils.hashString(password)
            user.country = country
            user.city = city
            let realm = try Realm(configuration: config)
            realm.safeWrite {
                realm.add(user)
            }
            appSession.currentUser = user
        } catch let error {
            print("Error initializing Realm: \(error.localizedDescription)")
        }
    }
    func handleSubmitButton() {
        let utils = Utils()
        let userData = [country]
        let completionData = [isUsernameCompleted, isEmailCompleted,
                              isPasswordCompleted, isConfirmPasswordCompleted, isEmailConfirmed]
        var isFormCompleted = true
        isFormCompleted = utils.checkBools(completionData)
        isFormCompleted = utils.checkBlanks(userData)
        if isFormCompleted {
            errorMessage = ""
            signUp()
            showHomeView = true
        } else {
            errorMessage = "Please fill out the form!"
        }
    }
}

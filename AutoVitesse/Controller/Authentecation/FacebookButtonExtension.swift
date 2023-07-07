//
//  FacebookButtonExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 7.06.23.
//

import Foundation
import FBSDKLoginKit
import RealmSwift

extension FacebookButton {
    func facebookSignIn() {
        manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let isCancelled = result?.isCancelled else {
                return
            }
            if !isCancelled {
                let request = GraphRequest(graphPath: "me", parameters: ["fields": "email"])
                request.start { (_, res, _) in
                    guard let profileData = res as? [String: Any]else {return}
                    if let email = profileData["email"] as? String {
                        handleSignIn(email)
                    }
                }
            }
        }
    }
    func handleSignIn(_ email: String) {
        do {
            let realm = try Realm(configuration: config)
            if let user = realm.objects(User.self).filter("email = %@", email).first {
                appSession.currentUser = user
                showHomeView = true
            } else {
                let user = User()
                user.email = email
                appSession.currentUser = user
                showFacebookSignUp = true
            }
        } catch let error {
            print("Error initializing Realm: \(error.localizedDescription)")
        }
    }
}

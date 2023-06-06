//
//  SignInExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 15.05.23.
//

import Foundation
import RealmSwift
import FBSDKLoginKit

extension SignInFormView {
    
    func signIn (username: String, password: String){
        let utils = Utils()
        do{
            let realm = try Realm(configuration: config)
            //print(Realm.Configuration.defaultConfiguration.fileURL)
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
    
    func facebookSignIn(){
        
        manager.logIn(permissions: ["public_profile","email"], from: nil){
            (result, error) in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            let request = GraphRequest(graphPath: "me", parameters: ["fields": "email"])
            request.start{ (_, res, _) in
                guard let profileData = res as? [String: Any]else{return}

                print(profileData["email"] as! String )
            }
        }
    }
}

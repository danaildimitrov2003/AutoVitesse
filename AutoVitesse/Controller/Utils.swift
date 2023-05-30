//
//  hashPassword.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation
import CryptoKit
import RealmSwift

class Utils{
    
    func hashString(_ string : String) -> String {
        guard let data = string.data(using: .utf8) else { return "string" }
        let hashedData = SHA256.hash(data: data)
        let hashedString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashedString
    }
    
    func checkBools(_ bools: [Bool]) -> Bool{
        for bool in bools {
            if(bool == false){
                return false
            }
        }
        return true
    }
    
    func isCarFavourited(carId : String) -> Bool{
        var result = false
        guard let userId = appSession.currentUser?.idString else {
           fatalError("User Id is nil!")
        }
        do{
            let realm = try Realm(configuration: config)
            if let favouriteCars = realm.objects(FavouriteCars.self).filter("userId == %@", userId).first {
                if favouriteCars.carIds.contains(carId) {
                    result =  true
                }
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
        return result
    }
}

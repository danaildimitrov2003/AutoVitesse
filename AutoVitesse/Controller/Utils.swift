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
        let realm = try! Realm()
        if let favouriteCars = realm.objects(FavouriteCars.self).filter("userId == %@", appSession.currentUser!.idString).first {
            if favouriteCars.carIds.contains(carId) {
                result =  true
            }
        }
        return result
    }
}

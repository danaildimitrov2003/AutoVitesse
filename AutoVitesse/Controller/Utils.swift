//
//  hashPassword.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 18.05.23.
//

import Foundation
import CryptoKit
import RealmSwift
import UIKit

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
        let userId = getCurrentUser().idString
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
    
    func getCurrentUser() -> User{
        guard let user = appSession.currentUser else {
           return User()
        }
        return user
    }
    
    func generateArray(min : Int, max : Int) -> Array<Int>{
        return Array(min...max)
    }
    
    enum SortOrder {
        case ascending
        case descending
        case none
    }
    
    func getImageFromName(fileName: String) -> UIImage{
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent(fileName)
        var image = UIImage()
        
        if let imageData = try? Data(contentsOf: url) {
            if let imageFromData = UIImage(data: imageData) {
                image = imageFromData
            } else {
                print("Couldn't get image data for \(fileName)")
            }
        } else {
            print("Couldn't get image data for \(fileName)")
        }
        return image
    }
    
    func saveImageLocally(image: UIImage, fileName: String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent(fileName)
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write \(fileName) Image Data to Disk")
            }
        }
    }
    
    func checkBlanks(_ strings: [String]) -> Bool{
        for string in strings {
            if(string == ""){
                return false
            }
        }
        return true
    }
    
    func getUserByID(userID: String) -> User? {
        do {
            let realm = try Realm()
            let user = realm.object(ofType: User.self, forPrimaryKey: try ObjectId(string: userID))
            return user
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

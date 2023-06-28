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
import PDFNet

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
    
    func getCarForSaleByID(carForSaleID: String) -> CarForSale? {
        do {
            let realm = try Realm()
            let carForSale = realm.object(ofType: CarForSale.self, forPrimaryKey: try ObjectId(string: carForSaleID))
            return carForSale
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func exportAnnotationsToXFDF(fileName: String) {
        do {
            try PTPDFNet.catchException {
                let docPath = Bundle.main.path(forResource: fileName, ofType: "pdf")
                let doc = PTPDFDoc(filepath: docPath!)
                doc?.initSecurityHandler()
                
                let xfdfDoc = doc?.fdfExtract(e_ptannots_only)
                let xfdfPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                    .appending("/\(fileName)-\(self.getCurrentUser().idString).xfdf")
                xfdfDoc?.save(asXFDF: xfdfPath)
                
                let fdoc_new: PTFDFDoc = (doc?.fdfExtract(e_ptboth))!
                let XFDF_str: String = fdoc_new.saveAsXFDFToString()
                print("Extracted XFDF: ")
                print("\(XFDF_str)")
                print("Annotations exported to XFDF successfully.")
                print(xfdfPath)
            }
        } catch let e as NSError {
            print("\(e)")
        }
    }
    
    func mergeXFDFIntoPDF(fileName: String) {
        
        do {
            try PTPDFNet.catchException {
                let xfdfPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                    .appending("/\(fileName)-\(self.getCurrentUser().idString).xfdf")
                let fdf_doc: PTFDFDoc = PTFDFDoc.create(fromXFDF: xfdfPath)
                //let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                // .appending("/\(fileName).pdf")
                let docPath = Bundle.main.path(forResource: fileName, ofType: "pdf")
                let doc = PTPDFDoc(filepath: docPath)
                doc?.initSecurityHandler()
                //                doc?.fdfMerge(fdf_doc)
                //                doc?.fdfUpdate(fdf_doc)
                doc?.mergeXFDF(with: xfdfPath, opts: nil)
                //doc?.save(toFile: fileName, flags: e_ptlinearized.rawValue)
                //                let modifiedDocPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                //                    .appending("/\(fileName)-\(self.getCurrentUser().idString).pdf")
                //                doc?.save(toFile: modifiedDocPath, flags: e_ptlinearized.rawValue)
                doc?.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("form1_filled_with_annots.pdf").path, flags: e_ptlinearized.rawValue)
                print("XFDF data merged into PDF successfully.")
            }
        } catch let e as NSError {
            print("\(e)")
        }
        print("dfddfgdfgdfg")
    }
    
    
}

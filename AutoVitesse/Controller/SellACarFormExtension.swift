//
//  SellACarFormExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 13.06.23.
//

import Foundation
import UIKit
import RealmSwift

extension SellACarForm{
    func handleSaveButton(){
        let utils = Utils()
        let carData = [model, year, description, horsePower, mileage, price]
        var isFormCompleted = true
        isFormCompleted = utils.checkBlanks(carData)
        if(image == UIImage()){
            isFormCompleted = false
            errorMessage = "Please upload a photo!"
        }
        if(isFormCompleted){
            errorMessage = ""
            save()
            presentationMode.wrappedValue.dismiss()
        }else{
            errorMessage = "Please fill out the form!"
        }
    }
    
    func save(){
        let utils = Utils()
        let fileName = UUID().uuidString
        utils.saveImageLocally(image: image, fileName: fileName)
        do{
            let carForSale = CarForSale()
            carForSale.make = make
            carForSale.model = model
            carForSale.year = Int(year)!
            carForSale.type = type
            carForSale.carDescription = description
            carForSale.horsePower = Int(horsePower)!
            carForSale.fuel = fuel
            carForSale.transmission = transmission
            carForSale.mileage = mileage
            carForSale.price = Int(price)!
            carForSale.photoId = fileName
            carForSale.sellerId = utils.getCurrentUser().idString
            let realm = try Realm(configuration: config)
            realm.safeWrite {
                realm.add(carForSale)
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
    }
}

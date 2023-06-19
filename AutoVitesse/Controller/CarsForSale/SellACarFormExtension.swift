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
        if(isFormCompleted){
            if(image == UIImage()){
                isFormCompleted = false
                errorMessage = "Please upload a photo!"
            }else{
                errorMessage = ""
                save()
                presentationMode.wrappedValue.dismiss()
            }
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
            if let yearInt = Int(year) {
                carForSale.year = yearInt
            }
            if let horsePowerInt = Int(horsePower) {
                carForSale.horsePower = horsePowerInt
            }
            if let priceInt = Int(price) {
                carForSale.price = priceInt
            }
            if let mileageInt = Int(mileage) {
                carForSale.mileage = mileageInt
            }
            carForSale.make = make
            carForSale.model = model
            carForSale.type = type
            carForSale.carDescription = description
            carForSale.fuel = fuel
            carForSale.transmission = transmission
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

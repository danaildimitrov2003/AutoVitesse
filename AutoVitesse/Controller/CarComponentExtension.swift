//
//  CarComponentExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 23.05.23.
//

import Foundation
import RealmSwift

extension CarComponent{
    
    func handleFavouriteClick(userId : String, carId : String){
        let favouriteCars = FavouriteCars()
        favouriteCars.userId = userId
        favouriteCars.carIds.append(carId)
        
        let realm = try! Realm()
        if let userFavouriteCars = realm.objects(FavouriteCars.self).filter("userId = %@", userId).first{
            try? realm.write {
                userFavouriteCars.thaw()!.carIds.append(carId)
            }
        }else{
            try? realm.write {
                realm.add(favouriteCars)
            }
        }
    }
    
    func handleUnFavouriteClick(userId : String, carId : String){
        let realm = try! Realm()
        if let userFavouriteCars = realm.objects(FavouriteCars.self).filter("userId = %@", userId).first{
            let index = userFavouriteCars.carIds.index(of: carId)
            try! realm.write {
                userFavouriteCars.carIds.remove(at: index!)
            }
        }
        
    }
    
}

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
        do{
            let realm = try Realm(configuration: config)
            guard let userFavouriteCars = realm.objects(FavouriteCars.self).filter("userId = %@", userId).first else {
                realm.safeWrite {
                    realm.add(favouriteCars)
                }
                return
            }
            realm.safeWrite {
                userFavouriteCars.thaw()?.carIds.append(carId)
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
        
    }
    
    func handleUnFavouriteClick(userId : String, carId : String){
        do{
            let realm = try Realm(configuration: config)
            if let userFavouriteCars = realm.objects(FavouriteCars.self).filter("userId = %@", userId).first{
                if let index = userFavouriteCars.carIds.index(of: carId){
                    realm.safeWrite {
                        userFavouriteCars.carIds.remove(at: index)
                    }
                }
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
        
        
    }
    
}

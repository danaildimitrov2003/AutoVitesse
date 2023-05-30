//
//  FavouritesViewExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 23.05.23.
//

import Foundation
import RealmSwift

extension FavouritesView{
    
    func getFavouriteCars() -> [Car]{
        var carIds : [String] = []
        var cars : [Car] = []
        do{
            let realm = try Realm(configuration: config)
            if let favouriteCars = realm.objects(FavouriteCars.self).filter("userId == %@", appSession.currentUser?.idString).first {
                carIds = Array(favouriteCars.carIds)
            }
            for id in carIds {
                if let car = realm.object(ofType: Car.self, forPrimaryKey: try ObjectId(string: id)) {
                    cars.append(car)
                }
            }
        }catch let error{
            print("Error initializing Realm: \(error.localizedDescription)")
        }
        
        return cars
    }
}

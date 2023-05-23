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
        let realm = try! Realm()
        var carIds : [String] = []
        var cars : [Car] = []
        
        if let favouriteCars = realm.objects(FavouriteCars.self).filter("userId == %@", appSession.currentUser?.idString).first {
            carIds = Array(favouriteCars.carIds)
        }
        
        for id in carIds {
            if let car = realm.object(ofType: Car.self, forPrimaryKey: try! ObjectId(string: id)) {
                cars.append(car)
            }
        }
        return cars
    }
}

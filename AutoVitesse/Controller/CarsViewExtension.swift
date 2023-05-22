//
//  CarsViewExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import Foundation
import RealmSwift

extension CarsView{
    
    func loadCars() -> [Car]{
        let realm = try! Realm()
        return realm.objects(Car.self).toArray()
    }
}

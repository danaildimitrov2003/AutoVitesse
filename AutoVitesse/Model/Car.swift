//
//  Car.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import Foundation
import RealmSwift

class Car: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var make = ""
    @Persisted var model = ""
    @Persisted var year = 0
    @Persisted var type = ""
    @Persisted var apiId = 0
    
    var idString: String {
        return id.stringValue
    }
}

struct apiCar: Hashable, Codable{
    var id : Int
    var make : String
    var model : String
    var year : Int
    var type : String
}

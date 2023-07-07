//
//  CarForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.06.23.
//

import Foundation
import RealmSwift

class CarForSale: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var make = ""
    @Persisted var model = ""
    @Persisted var year = 0
    @Persisted var type = ""
    @Persisted var carDescription = ""
    @Persisted var horsePower = 0
    @Persisted var fuel = ""
    @Persisted var transmission = ""
    @Persisted var mileage = 0
    @Persisted var price = 0
    @Persisted var sellerId = ""
    @Persisted var photoId = ""
    var idString: String {
        return id.stringValue
    }
}

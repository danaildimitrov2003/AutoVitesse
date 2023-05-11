//
//  Car.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import Foundation
import RealmSwift

class Car: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var make = ""
    @Persisted var model = ""
    @Persisted var year = 0
    @Persisted var type = ""
}

//
//  FavouriteCars.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 23.05.23.
//

import Foundation
import RealmSwift

class FavouriteCars: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var userId: String
    @Persisted var carIds: List<String>
}

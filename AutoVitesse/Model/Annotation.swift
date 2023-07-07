//
//  Annotation.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 3.07.23.
//

import Foundation
import RealmSwift

class Annotation: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var xfdfString = ""
    @Persisted var userId = ""
    @Persisted var fileName = ""
    var idString: String {
        return id.stringValue
    }
}

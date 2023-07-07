//
//  Images.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 26.05.23.
//

import Foundation
import RealmSwift
// here
class UserImage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var userId = ""
    @Persisted var imageId = ""
}

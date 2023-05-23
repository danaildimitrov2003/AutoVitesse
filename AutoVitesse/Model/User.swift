//
//  UserModel.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var username = ""
    @Persisted var password = ""
    @Persisted var email = ""
    @Persisted var country = ""
    @Persisted var city = ""
    
    var idString: String {
        return id.stringValue
    }
}

class AppSession: ObservableObject {
    @Published var currentUser: User?
}

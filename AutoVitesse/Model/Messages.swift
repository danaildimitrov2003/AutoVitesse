//
//  Messages.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 20.06.23.
//

import Foundation
import RealmSwift

class Dialogue: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var carForSaleId = ""
    @Persisted var sellerId = ""
    @Persisted var buyerId = ""
    @Persisted var messages : List<Message>
    
    var idString: String {
        return id.stringValue
    }
    
}

class Message: Object{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var senderId = ""
    @Persisted var message = ""
    
    
    var idString: String {
        return id.stringValue
    }
    
}

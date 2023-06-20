//
//  CarMessageExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 20.06.23.
//

import Foundation
import RealmSwift

extension CarMessageComposeView{
    
    func sendMessage() {
        let message = Message()
        message.senderId = utils.getCurrentUser().idString
        message.message = messageCar
        
        let dialogue = Dialogue()
        dialogue.buyerId = utils.getCurrentUser().idString
        dialogue.sellerId = carForSale.sellerId
        dialogue.carForSaleId = carForSale.idString
        
        do {
            let realm = try Realm(configuration: config)
            try realm.write {
                realm.add(dialogue)
                dialogue.messages.append(message)
            }
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Unable to save message to Realm: \(error)")
        }
    }

}

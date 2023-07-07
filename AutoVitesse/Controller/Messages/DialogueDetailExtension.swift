//
//  DialogueDetailExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import Foundation
import RealmSwift
import SwiftUI

extension DialogueDetailView {
    func sendMessage(message: String) {
        do {
            let realm = try Realm()
            guard let realmDialogue = realm.objects(Dialogue.self).filter("id = %@", dialogue.id).first else {
                return
            }
            let messageToSend = Message()
            messageToSend.message = message
            messageToSend.senderId = utils.getCurrentUser().idString
            withAnimation(.linear) {
                messages.append(messageToSend)
            }
            realm.safeWrite {
                realmDialogue.thaw()?.messages.append(messageToSend)
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

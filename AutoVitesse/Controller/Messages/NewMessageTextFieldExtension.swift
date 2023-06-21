//
//  NewMessageTextFieldExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 21.06.23.
//

import Foundation

extension NewMessageTextField{
    func saveMessage(){
        if(newMessage != ""){
            sendMessage(newMessage)
            newMessage = ""
        }
    }
}

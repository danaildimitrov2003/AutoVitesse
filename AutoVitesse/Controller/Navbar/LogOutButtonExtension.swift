//
//  LogOutButtonExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import Foundation
import SwiftyDropbox

extension LogOutButton {
    func logOut() {
        showLogOutView = true
        if DropboxClientsManager.authorizedClient != nil {
            DropboxClientsManager.unlinkClients()
        }
    }
}

//
//  AutoVitesseApp.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift

let appSession = AppSession()

@main
struct AutoVitesseApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appSession)
        }
    }
}

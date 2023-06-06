//
//  AutoVitesseApp.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift
import FBSDKCoreKit

let appSession = AppSession()

let config = Realm.Configuration(
    schemaVersion: 2,
    migrationBlock: { migration, oldSchemaVersion in
        if oldSchemaVersion < 2 {
            migration.enumerateObjects(ofType: Car.className()) { oldObject, newObject in
                newObject?["apiId"] = ""
            }
        }
    }
)

@main
struct AutoVitesseApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appSession)
                .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
        }
    }
}


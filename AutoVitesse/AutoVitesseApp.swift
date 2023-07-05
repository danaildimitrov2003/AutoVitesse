//
//  AutoVitesseApp.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 11.05.23.
//

import SwiftUI
import RealmSwift
import FBSDKCoreKit
import PDFNet
import SwiftyDropbox

let appSession = AppSession()

let config = Realm.Configuration(
    schemaVersion: 4,
    migrationBlock: { migration, oldSchemaVersion in
        if oldSchemaVersion < 2 {
            migration.enumerateObjects(ofType: Car.className()) { oldObject, newObject in
                newObject?["apiId"] = ""
            }
        }
        if oldSchemaVersion < 3 {
            migration.enumerateObjects(ofType: CarForSale.className()) { oldObject, newObject in
                newObject?["price"] = 0
            }
        }
        if oldSchemaVersion < 4 {
            migration.enumerateObjects(ofType: CarForSale.className()) { oldObject, newObject in
                if let mileage = oldObject?["mileage"] as? String {
                    if let intValue = Int(mileage) {
                        newObject?["mileage"] = intValue
                    }
                }
            }
        }
    }
)

@main
struct AutoVitesseApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let env = Environment()
    init() {
        DropboxClientsManager.setupWithAppKey(env.dropBoxAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appSession)
                .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            ApplicationDelegate.shared.application(
                application,
                didFinishLaunchingWithOptions: launchOptions
            )
            //logout dropbox
            if(DropboxClientsManager.authorizedClient != nil) {
                DropboxClientsManager.unlinkClients()
            }
            return true
        }
        
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            
            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )
        }
        
        func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            PTPDFNet.initialize("Insert Commercial License Key Here After Purchase")
            return true
        }
    }
}


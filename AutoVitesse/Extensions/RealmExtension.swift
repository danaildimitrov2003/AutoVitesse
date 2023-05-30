//
//  RealmExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.05.23.
//

import Foundation
import RealmSwift

extension Realm {
    func safeWrite(_ block: (() throws -> Void)) {
        do {
            try write {
                try block()
            }
        } catch let error {
            print("Error writing to Realm: \(error.localizedDescription)")
        }
    }
}

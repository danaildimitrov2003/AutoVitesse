//
//  ResultsExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import Foundation
import RealmSwift

extension Results {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}

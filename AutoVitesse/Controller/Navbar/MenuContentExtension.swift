//
//  MenuContentExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.05.23.
//

import Foundation

extension MenuContent {
    func handleButtonTab(itemText: String) {
        if itemText == currentViewName {
            toggleMenu()
        } else {
            selection = itemText
        }
    }
}

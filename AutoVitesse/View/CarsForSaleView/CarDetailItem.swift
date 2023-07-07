//
//  CarDetailItem.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 14.06.23.
//

import SwiftUI

struct CarDetailItem: View {
    let title: String
    let value: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title)
                .foregroundColor(Color("TextColor"))
        }
    }
}

struct CarDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailItem(title: "Make", value: "Bmw")
    }
}

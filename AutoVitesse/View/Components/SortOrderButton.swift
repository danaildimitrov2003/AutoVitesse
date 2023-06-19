//
//  SortOrderButton.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct SortOrderButton: View {
    @Binding var sortOrder : Utils.SortOrder
    @Binding var otherSortOrder : Utils.SortOrder
    @Binding var otherSortOrder2 : Utils.SortOrder
    @State var buttonText : String
    
    var body: some View {
        HStack {
            Spacer()
            Text(buttonText)
            Button(action: {
                switch sortOrder {
                case .ascending:
                    sortOrder = .descending
                    otherSortOrder = .none
                    otherSortOrder2 = .none
                case .descending:
                    sortOrder = .none
                case .none:
                    sortOrder = .ascending
                    otherSortOrder = .none
                    otherSortOrder2 = .none
                }
            }) {
                switch sortOrder {
                case .ascending:
                    Image(systemName: "arrow.up.circle")
                case .descending:
                    Image(systemName: "arrow.down.circle")
                case .none:
                    Image(systemName: "minus.circle")
                }
            }
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }
    }
}

struct SortOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        SortOrderButton(sortOrder: .constant(Utils.SortOrder.none), otherSortOrder:.constant(Utils.SortOrder.none) , otherSortOrder2: .constant(Utils.SortOrder.none), buttonText: "Button")
    }
}

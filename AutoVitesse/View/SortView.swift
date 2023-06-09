//
//  SortView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct SortView: View {
    @State var alphabeticalSortOrder = Utils.SortOrder.none
    @State var priceSortOrder = Utils.SortOrder.none
    @State var yearSortOrder = Utils.SortOrder.none
    var body: some View {
        List{
            VStack(alignment: .center){
                Text("Sort")
                    .font(.title)
                SortOrderButton(sortOrder: $alphabeticalSortOrder, buttonText: "Alphabetically")
                SortOrderButton(sortOrder: $priceSortOrder, buttonText: "Price")
                SortOrderButton(sortOrder: $yearSortOrder, buttonText: "Year")
            }
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}

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
                SortOrderButton(sortOrder: $alphabeticalSortOrder, otherSortOrder: $priceSortOrder, otherSortOrder2: $yearSortOrder, buttonText: "Alphabetically")
                SortOrderButton(sortOrder: $priceSortOrder, otherSortOrder: $alphabeticalSortOrder, otherSortOrder2: $yearSortOrder, buttonText: "Price")
                SortOrderButton(sortOrder: $yearSortOrder, otherSortOrder: $alphabeticalSortOrder, otherSortOrder2: $priceSortOrder, buttonText: "Year")
            }
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}

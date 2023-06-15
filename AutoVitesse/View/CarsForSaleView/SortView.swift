//
//  SortView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct SortView: View {
    @Binding var alphabeticalSortOrder : Utils.SortOrder
    @Binding var priceSortOrder : Utils.SortOrder
    @Binding var yearSortOrder : Utils.SortOrder
    let sortCars: () -> Void
    var body: some View {
        List{
            VStack(alignment: .center){
                Text("Sort")
                    .font(.title)
                SortOrderButton(sortOrder: $alphabeticalSortOrder, otherSortOrder: $priceSortOrder, otherSortOrder2: $yearSortOrder, buttonText: "Alphabetically")
                SortOrderButton(sortOrder: $priceSortOrder, otherSortOrder: $alphabeticalSortOrder, otherSortOrder2: $yearSortOrder, buttonText: "Price")
                SortOrderButton(sortOrder: $yearSortOrder, otherSortOrder: $alphabeticalSortOrder, otherSortOrder2: $priceSortOrder, buttonText: "Year")
                    .onChange(of: alphabeticalSortOrder) { newValue in
                        sortCars()
                    }
                    .onChange(of: priceSortOrder) { newValue in
                        sortCars()
                    }
                    .onChange(of: yearSortOrder) { newValue in
                        sortCars()
                    }
            }
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView(alphabeticalSortOrder: .constant(Utils.SortOrder.none), priceSortOrder: .constant(Utils.SortOrder.none), yearSortOrder: .constant(Utils.SortOrder.none), sortCars: {print("Sorted!")})
    }
}

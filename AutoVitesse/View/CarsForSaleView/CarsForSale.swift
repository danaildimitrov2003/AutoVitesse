//
//  CarsForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct CarsForSale: View {
    @State var isFilterOpened = false
    @State var isSortOpened = false
    @State var isSellACarOpened = false
    var body: some View {
        ScrollView {
            VStack{
                SearchBarCarsForSale()
                HStack{
                    Button(action: {isFilterOpened.toggle()}) {
                        AccentColorButtonText(buttonText: "Filter")
                    }
                    Button(action: {isSortOpened.toggle()}) {
                        AccentColorButtonText(buttonText: "Sort")
                    }
                }
                Button(action: {isSellACarOpened.toggle()}) {
                    AccentColorButtonText(buttonText: "Sell a car")
                }
                CarsForSaleList()
                .sheet(isPresented: $isFilterOpened) {
                    FilterView()
                }
                .sheet(isPresented: $isSortOpened) {
                    SortView()
                }
                .sheet(isPresented: $isSellACarOpened) {
                    SellACarForm()
                }
                
            }
        }
        
    }
}

struct CarsForSale_Previews: PreviewProvider {
    static var previews: some View {
        CarsForSale()
    }
}

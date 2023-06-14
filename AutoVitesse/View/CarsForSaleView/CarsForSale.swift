//
//  CarsForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI
import RealmSwift

struct CarsForSale: View {
    @State var isFilterOpened = false
    @State var isSortOpened = false
    @State var isSellACarOpened = false
    @ObservedResults(
    CarForSale.self
    ) var carsForSale
    var utils = Utils()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
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
                        .sheet(isPresented: $isFilterOpened) {
                            FilterView()
                        }
                        .sheet(isPresented: $isSortOpened) {
                            SortView()
                        }
                        .sheet(isPresented: $isSellACarOpened) {
                            SellACarForm()
                        }
                        if(carsForSale.count >= 1){
                            ForEach(carsForSale.reversed()) { car in
                                NavigationLink(value: car){
                                    CarForSaleComponent(image: utils.getImageFromName(fileName: car.photoId), make: car.make, model: car.model, year: car.year, price: car.price)
                                }
                            }
                        }else{
                            Text("There are currently no cars for sale")
                                .font(.title)
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                }
                .navigationDestination(for: CarForSale.self){ car in
                    CarDetailView(carForSale: car)
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

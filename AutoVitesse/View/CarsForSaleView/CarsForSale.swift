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
    @State var alphabeticalSortOrder = Utils.SortOrder.none
    @State var priceSortOrder = Utils.SortOrder.none
    @State var yearSortOrder = Utils.SortOrder.none
    @State var carsForSaleArray: [CarForSale] = []
    @State var filteredCarsForSaleArray: [CarForSale] = []
    @State var searchCarsForSaleArray: [CarForSale] = []
    @State var make = ""
    @State var model = ""
    @State var model2 = ""
    @State var model3 = ""
    @State var minYear = 1984
    @State var maxYear = 2024
    @State var minYearInitial = 1984
    @State var maxYearInitial = 2024
    @State var minPrice = "1000"
    @State var maxPrice = "1000000"
    @State var search = ""
    @ObservedResults(CarForSale.self) var carsForSale
    var utils = Utils()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        SearchBarCarsForSale(search: $search, searchCars: searchCarsForSale)
                        HStack {
                            Button(action: { isFilterOpened.toggle() }, label: {
                                AccentColorButtonText(buttonText: "Filter")
                            })
                            Button(action: { isSortOpened.toggle() }, label: {
                                AccentColorButtonText(buttonText: "Sort")
                            })
                        }
                        Button(action: { isSellACarOpened.toggle() }, label: {
                            AccentColorButtonText(buttonText: "Sell a car")
                        })
                        .sheet(isPresented: $isFilterOpened) {
                            FilterView(makeBinding: $make, modelBinding: $model, model2Binding: $model2,
                                       model3Binding: $model3, minYearBinding: $minYear, maxYearBinding: $maxYear,
                                       minYearInitial: minYearInitial, maxYearInitial: maxYearInitial,
                                       minPriceBinding: $minPrice, maxPriceBinding: $maxPrice,
                                       filterCars: filterCarsForSale, clearFilterCars: clearFilterCarsForSale)
                        }
                        .sheet(isPresented: $isSortOpened) {
                            SortView(alphabeticalSortOrder: $alphabeticalSortOrder, priceSortOrder: $priceSortOrder,
                                     yearSortOrder: $yearSortOrder, sortCars: sortCarsForSale)
                        }
                        .sheet(isPresented: $isSellACarOpened) {
                            SellACarForm()
                        }
                        if carsForSaleArray.count >= 1 {
                            ForEach(carsForSaleArray) { car in
                                NavigationLink(value: car) {
                                    CarForSaleComponent(image: utils.getImageFromName(fileName: car.photoId),
                                                        make: car.make, model: car.model, year: car.year,
                                                        price: car.price)
                                }
                            }
                        } else {
                            Text("There are currently no cars for sale")
                                .font(.title)
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                }
                .navigationDestination(for: CarForSale.self) { car in
                    CarDetailView(carForSale: car, showMessageButton: true)
                }
                .onChange(of: carsForSale) { _ in
                    filterCarsForSale()
                }

            }
        }
    }
}

// struct CarsForSale_Previews: PreviewProvider {
//    static var previews: some View {
//        CarsForSale()
//    }
// }

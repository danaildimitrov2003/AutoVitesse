//
//  FilterViewExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 15.06.23.
//

import Foundation

extension FilterView{
    func saveFilter(){
        if minYear > maxYear {
            print("jjj")
            errorMessage = "Please enter a valid years range!"
        } else {
            if let intMinPrice = Int(minPrice), let intMaxPrice = Int(maxPrice) {
                if intMinPrice > intMaxPrice {
                    errorMessage = "Please enter a valid price range!"
                } else {
                    errorMessage = ""
                    makeBinding = make
                    modelBinding = model
                    model2Binding = model2
                    model3Binding = model3
                    minYearBinding = minYear
                    maxYearBinding = maxYear
                    minPriceBinding = minPrice
                    maxPriceBinding = maxPrice
                    filterCars()
                }
            }
        }
    }
    
    func clearFilters(){
        make = ""
        model = ""
        model2 = ""
        model3 = ""
        minYear = 1984
        maxYear = 2024
        minPrice = "1000"
        maxPrice = "1000000"
        clearFilterCars()
    }
}

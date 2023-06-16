//
//  CarsForSaleExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 15.06.23.
//

import Foundation

extension CarsForSale{
    
    func sortCarsForSale() {
        if priceSortOrder == .none && yearSortOrder == .none && alphabeticalSortOrder == .none {
            carsForSaleArray = searchCarsForSaleArray
            return
        }
        
        carsForSaleArray.sort { car1, car2 in
            if priceSortOrder != .none {
                if car1.price != car2.price {
                    if priceSortOrder == .ascending {
                        return car1.price < car2.price
                    } else {
                        return car1.price > car2.price
                    }
                }
            }
            
            if yearSortOrder != .none {
                if car1.year != car2.year {
                    if yearSortOrder == .ascending {
                        return car1.year < car2.year
                    } else {
                        return car1.year > car2.year
                    }
                }
            }
            
            if car1.make != car2.make {
                if alphabeticalSortOrder == .ascending {
                    return car1.make < car2.make
                } else {
                    return car1.make > car2.make
                }
            }
            
            return true
        }
    }
    
    func filterCarsForSale() {
        filteredCarsForSaleArray = carsForSale.reversed().filter { car in
            var passFilters = true
            if !make.isEmpty && car.make != make {
                passFilters = false
            }
            
            let models = [model, model2, model3].filter { !$0.isEmpty }
            if !models.isEmpty && !models.contains(car.model) {
                passFilters = false
            }
            
            if car.year < minYear || car.year > maxYear {
                passFilters = false
            }
            
            if let minPriceInt = Int(minPrice),
               let maxPriceInt = Int(maxPrice) {
                if car.price < minPriceInt || car.price > maxPriceInt {
                    passFilters = false
                }
            } else {
                passFilters = false
            }
            
            return passFilters
        }
        searchCarsForSale() 
    }
    
    func clearFilterCarsForSale(){
        filteredCarsForSaleArray = carsForSale.reversed()
        searchCarsForSale()
        make = ""
        model = ""
        model2 = ""
        model3 = ""
        minYear = 1984
        maxYear = 2024
        minPrice = "1000"
        maxPrice = "1000000"
    }
    
    func searchCarsForSale() {
        searchCarsForSaleArray = filteredCarsForSaleArray.filter { car in
            var passFilters = true
            
            if !search.isEmpty {
                let lowercasedSearch = search.lowercased()
                
                if car.make.lowercased().hasPrefix(lowercasedSearch) ||
                    car.model.lowercased().hasPrefix(lowercasedSearch) {
                    passFilters = true
                } else {
                    let yearContainsSearch = String(car.year).contains(lowercasedSearch)
                    passFilters = yearContainsSearch
                }
            }
            
            return passFilters
        }
        carsForSaleArray = searchCarsForSaleArray
        sortCarsForSale()
    }
    
    
}

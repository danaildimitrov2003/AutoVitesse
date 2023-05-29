//
//  SearchBarTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import Foundation
import RealmSwift

extension SearchBarTextField{
    
    func handleSearch(_ search : String){
        let env = Environment()
        if(search.count >= 2){
            let modifiedSearch = search.replacingOccurrences(of: " ", with: "%20")
            var request = URLRequest(url: URL(string: "https://car-data.p.rapidapi.com/cars?limit=50&page=0&model=\(modifiedSearch)")!,timeoutInterval: Double.infinity)
            request.addValue(env.apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
            request.addValue("car-data.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do{
                    let cars = try JSONDecoder().decode([apiCar].self, from: data)
                    saveCars(cars)
                }catch{
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    func saveCars(_ cars : [apiCar]){
        let realm = try! Realm()
        try? realm.write {
            for apiCar in cars{
                if(realm.objects(Car.self).filter("apiId = %@", apiCar.id).first == nil){
                    let car = Car()
                    car.make = apiCar.make
                    car.model = apiCar.model
                    car.year = apiCar.year
                    car.type = apiCar.type
                    car.apiId = apiCar.id
                    realm.add(car)
                }
            }
        }
    }
}

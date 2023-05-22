//
//  CarsView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 19.05.23.
//

import SwiftUI
import RealmSwift

struct CarsView: View {
    var body: some View {
        VStack(alignment: .center){
            SearchBarTextField()
            ScrollView {
                CarsList(cars: loadCars())
            }
        }
        
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}

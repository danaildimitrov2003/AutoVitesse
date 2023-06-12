//
//  SellACarForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.06.23.
//

import SwiftUI

struct SellACarForm: View {
    @State var make = ""
    @State var model = ""
    @State var year : Int?
    @State var type = ""
    @State var description = ""
    @State var horsePower : Int?
    @State var fuel = ""
    @State var transmission = ""
    @State var mileage : Int?
    @State var errorMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Make", text: $make)
                TextField("Model", text: $model)
                TextField("Year", value: $year, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                TextField("Type", text: $type)
                TextField("Description", text: $description)
                TextField("HorsePower", value: $horsePower, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                TextField("Fuel", text: $fuel)
                TextField("Transmission", text: $transmission)
                TextField("Mileage", value: $mileage, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                if(errorMessage != ""){
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Sell a car")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        //handleSubmitButton()
                    }
                    //.disabled(true)
                }
        }
        }
    }
}

struct SellACarForm_Previews: PreviewProvider {
    static var previews: some View {
        SellACarForm()
    }
}

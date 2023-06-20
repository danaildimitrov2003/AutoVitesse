//
//  SellACarForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 12.06.23.
//

import SwiftUI
import Combine

struct SellACarForm: View {
    @State var make = "Acura"
    @State var model = ""
    @State var year = ""
    @State var type = "Sedan"
    @State var description = ""
    @State var horsePower = ""
    @State var fuel = "Gasoline"
    @State var transmission = "Manual"
    @State var mileage = ""
    @State var price = ""
    @State var errorMessage = ""
    @State var image = UIImage()
    @State private var showLibrary = false
    @State private var showCamera = false
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Picker("Make", selection: $make) {
                    ForEach(carMakes, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                TextField("Model", text: $model)
                NumericTextField(title: "Year", value: $year)
                Picker("Type", selection: $type) {
                    ForEach(carTypes, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                NumericTextField(title: "HorsePower", value: $horsePower)
                Picker("Fuel", selection: $fuel) {
                    ForEach(fuelTypes, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                Picker("Transmission", selection: $transmission) {
                    ForEach(transmissionTypes, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                NumericTextField(title: "Mileage", value: $mileage)
                Group{
                    NumericTextField(title: "Price", value: $price)
                    Text("Description")
                    TextEditor(text: $description)
                    Text("Photo")
                    HStack {
                        Spacer()
                        Button(action: {showLibrary.toggle()}) {
                            AccentColorButtonText(buttonText: "Upload from device")
                        }
                        Spacer()
                            .sheet(isPresented: $showLibrary) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                            }
                    }
                    HStack {
                        Spacer()
                        Button(action: {showCamera.toggle()}) {
                            AccentColorButtonText(buttonText: "Use Camera")
                        }
                        Spacer()
                            .sheet(isPresented: $showCamera) {
                                ImagePicker(sourceType: .camera, selectedImage: self.$image)
                            }
                    }
                    if image != UIImage() {
                        HStack {
                            Spacer()
                            CarForSaleComponent(image: image, make: make, model: model, year: 1977, price: 9999)
                            Spacer()
                        }
                    }
                    if errorMessage != "" {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Sell a car")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        handleSaveButton()
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

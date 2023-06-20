//
//  CarDetailView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 14.06.23.
//

import SwiftUI

struct CarDetailView: View {
    let carForSale: CarForSale
    @State private var carImage: UIImage?
    @State var showCarMassage = false
    var utils = Utils()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    if let carImage = carImage {
                        Image(uiImage: carImage)
                            .resizable()
                            .cornerRadius(15)
                            .frame(width: 300, height: 300)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Rectangle())
                    } else {
                        Text("No Image")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            CarDetailItem(title: "Make", value: carForSale.make)
                            CarDetailItem(title: "Model", value: carForSale.model)
                            CarDetailItem(title: "Year", value: String(carForSale.year))
                            CarDetailItem(title: "Horsepower", value: String(carForSale.horsePower))
                        }
                        HStack{
                            CarDetailItem(title: "Type", value: carForSale.type)
                            CarDetailItem(title: "Transmission", value: carForSale.transmission)
                            CarDetailItem(title: "Fuel", value: carForSale.fuel)
                        }
                        HStack{
                            CarDetailItem(title: "Mileage", value: String(carForSale.mileage))
                            CarDetailItem(title: "Price", value: "\(carForSale.price) $")
                        }
                        VStack(alignment: .leading){
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(carForSale.carDescription)
                                .multilineTextAlignment(.leading)
                                .font(.title2)
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                    Button(action: {showCarMassage.toggle()}) {
                        AccentColorButtonText(buttonText: "Message Seller")
                    }
                }
                .padding()
                .onAppear {
                    carImage = utils.getImageFromName(fileName: carForSale.photoId)
                }
            .navigationBarTitle("Car Details")
            }
            .sheet(isPresented: $showCarMassage) {
                CarMessageComposeView(carForSale: carForSale)
            }
        }
    }
}



struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let carForSale = CarForSale()
        carForSale.make = "BMW"
        carForSale.model = "M5"
        carForSale.year = 2022
        carForSale.type = "Sedan"
        carForSale.carDescription = "This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan.This is a powerful and luxurious sedan."
        carForSale.horsePower = 617
        carForSale.fuel = "Gasoline"
        carForSale.transmission = "Automatic"
        carForSale.mileage = 10000
        carForSale.price = 85000
        carForSale.sellerId = "6465e8bf881c671df018abdd"
        carForSale.photoId = "D94B19B6-E660-40B7-AF6C-73B4B31719CA"
        return CarDetailView(carForSale: carForSale)
    }
}

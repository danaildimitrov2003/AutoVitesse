//
//  FilterView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 8.06.23.
//

import SwiftUI

struct FilterView: View {
    @Binding var makeBinding : String
    @Binding var modelBinding : String
    @Binding var model2Binding : String
    @Binding var model3Binding : String
    @Binding var minYearBinding : Int
    @Binding var maxYearBinding : Int
    @Binding var minPriceBinding : String
    @Binding var maxPriceBinding : String
    @State var make : String
    @State var model : String
    @State var model2 : String
    @State var model3 : String
    @State var minYear : Int
    @State var maxYear : Int
    @State var minYearInitial : Int
    @State var maxYearInitial : Int
    @State var minPrice : String
    @State var maxPrice : String
    @State var errorMessage = ""
    let filterCars: () -> Void
    let clearFilterCars: () -> Void
    
    init(makeBinding: Binding<String>,
         modelBinding: Binding<String>,
         model2Binding: Binding<String>,
         model3Binding: Binding<String>,
         minYearBinding: Binding<Int>,
         maxYearBinding: Binding<Int>,
         minYearInitial: Int,
         maxYearInitial: Int,
         minPriceBinding: Binding<String>,
         maxPriceBinding: Binding<String>,
         filterCars: @escaping () -> Void,
         clearFilterCars: @escaping () -> Void) {
        
        _makeBinding = makeBinding
        _modelBinding = modelBinding
        _model2Binding = model2Binding
        _model3Binding = model3Binding
        _minYearBinding = minYearBinding
        _maxYearBinding = maxYearBinding
        _minPriceBinding = minPriceBinding
        _maxPriceBinding = maxPriceBinding
        
        _make = State(initialValue: makeBinding.wrappedValue)
        _model = State(initialValue: modelBinding.wrappedValue)
        _model2 = State(initialValue: model2Binding.wrappedValue)
        _model3 = State(initialValue: model3Binding.wrappedValue)
        _minYear = State(initialValue: minYearBinding.wrappedValue)
        _maxYear = State(initialValue: maxYearBinding.wrappedValue)
        _minPrice = State(initialValue: minPriceBinding.wrappedValue)
        _maxPrice = State(initialValue: maxPriceBinding.wrappedValue)
        
        self.minYearInitial = minYearInitial
        self.maxYearInitial = maxYearInitial
        self.filterCars = filterCars
        self.clearFilterCars = clearFilterCars
    } 
    
    var body: some View {
        List{
            VStack{
                Text("Filter")
                    .font(.title)
                Picker("Make", selection: $make) {
                    ForEach(carMakes, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                if make != ""{
                    TextField("Model", text: $model)
                    TextField("Model", text: $model2)
                    TextField("Model", text: $model3)
                }else{
                    Text("Please select a make to select models")
                }
                RangePicker(title: "Year", min: minYearInitial, max: maxYearInitial, minBinding: $minYear, maxBinding: $maxYear)
                RangeFields(title: "Price", min: $minPrice, max: $maxPrice)
            }
            HStack{
                Spacer()
                Button(action: { saveFilter()}) {
                    AccentColorButtonText(buttonText: "Save Filters")
                }
                Spacer()
            }
            HStack{
                Spacer()
                Button(action: { clearFilters()}) {
                    AccentColorButtonText(buttonText: "Clear Filters")
                }
                Spacer()
            }
            if errorMessage != "" {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        
        
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(makeBinding: .constant(""), modelBinding: .constant(""), model2Binding: .constant(""), model3Binding: .constant(""), minYearBinding: .constant(1984), maxYearBinding: .constant(2024), minYearInitial: 1984, maxYearInitial: 2024, minPriceBinding: .constant("1000"), maxPriceBinding: .constant("1000000"), filterCars: {print("Filtered!")}, clearFilterCars: {print("Cleared Filter!")})
    }
}

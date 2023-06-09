//
//  SearchBarCarsForSale.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 9.06.23.
//

import SwiftUI

struct SearchBarCarsForSale: View {
    @State var search = ""
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .disableAutocorrectAndAutocapitalize()
                .font(.title)
                .frame(width: 220)
                .onChange(of: search) { newValue in
                    
                }
            Image(systemName:"magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.foregroundColor(.gray)
                .foregroundColor(Color("TextColor"))
                .frame(width:32, height: 32, alignment: .center)
        }
    }
}

struct SearchBarCarsForSale_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarCarsForSale()
    }
}

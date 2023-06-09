//
//  SearchBarTextField.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 22.05.23.
//

import SwiftUI

struct SearchBarTextField: View {
    @State var search = ""
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .disableAutocorrectAndAutocapitalize()
                .font(.title)
                .frame(width: 220)
                .onChange(of: search) { _ in
                    handleSearch(search)
                }
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("TextColor"))
                .frame(width: 32, height: 32, alignment: .center)
        }
    }
}

struct SearchBarTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarTextField()
    }
}

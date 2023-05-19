//
//  CarsView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 19.05.23.
//

import SwiftUI

struct CarsView: View {
    @State var search = ""
    var body: some View {
        VStack(alignment: .center){
            TextField("Search", text: $search)
                .font(.title)
            Text("There are no records")
                .font(.title2)
        }
        
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}

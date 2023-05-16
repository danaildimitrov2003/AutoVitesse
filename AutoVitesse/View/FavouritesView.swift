//
//  FavouritesView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        VStack{
            Text("Favourites")
                .font(.title)
            Text("No favorite items")
                .font(.title2)
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}

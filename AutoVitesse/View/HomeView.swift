//
//  HomeView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack{
                ProfileView()
                    .padding()
                FavouritesView()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

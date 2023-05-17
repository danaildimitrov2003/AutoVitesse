//
//  HomeView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 16.05.23.
//

import SwiftUI

struct HomeView: View {
    @State var menuOpened = false
    var body: some View {
        ZStack {
            VStack{
                //Navbar(menuOpened: $menuOpened)
                ProfileView()
                    .padding()
                FavouritesView()
                Spacer()
            }
            //SideMenu(width: UIScreen.main.bounds.width/1.8, menuOpened: menuOpened, toggleMenu: toggleMenu)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

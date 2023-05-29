//
//  NavbarContainerView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import SwiftUI

struct NavbarContainerView<Content: View>: View {
    let content : Content
    @State var menuOpened = false
    
    init(@ViewBuilder content : () -> Content){
        self.content = content()
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Navbar(toggleMenu: toggleMenu)
                ZStack {
                    Color("BackgroundColor")
                    VStack{
                        content
                            .frame(maxWidth : .infinity, maxHeight : .infinity)
                    }
                    SideMenu(width: UIScreen.main.bounds.width/1.8, menuOpened: menuOpened, toggleMenu: toggleMenu)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NavbarContainerView_Previews : PreviewProvider {
    static var previews: some View {
        NavbarContainerView{
            
        }
    }
}

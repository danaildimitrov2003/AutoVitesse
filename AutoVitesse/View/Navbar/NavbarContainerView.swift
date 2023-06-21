//
//  NavbarContainerView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import SwiftUI

struct NavbarContainerView<Content: View>: View {
    let content : Content
    let currentViewName : String
    @State var menuOpened = false
    
    init(currentViewName: String, @ViewBuilder content : () -> Content){
        self.content = content()
        self.currentViewName = currentViewName
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Navbar(toggleMenu: toggleMenu, menuOpened: $menuOpened)
                ZStack {
                    Color("BackgroundColor")
                    VStack{
                        Text("Email is not confirmed!")
                            .foregroundColor(Color("TextColor"))
                        Divider()
                        content
                            .frame(maxWidth : .infinity, maxHeight : .infinity)
                    }
                    SideMenu(width: UIScreen.main.bounds.width/1.8, menuOpened: menuOpened, toggleMenu: toggleMenu, currentViewName: currentViewName)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct NavbarContainerView_Previews : PreviewProvider {
    static var previews: some View {
        NavbarContainerView(currentViewName: "ViewName"){
            
        }
    }
}

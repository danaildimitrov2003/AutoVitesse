//
//  ContentView.swift
//  SideMenu
//
//  Created by Danail Dimitrov on 9.05.23.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id =  UUID()
    let text: String
    let imageName: String
}

struct MenuContent: View {
    @State var selection: String?
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house.fill"),
        MenuItem(text: "Cars", imageName: "car.2.fill"),
        MenuItem(text: "Photos", imageName: "camera.fill"),
        MenuItem(text: "Cars For Sale", imageName: "car.rear.waves.up.fill"),
        MenuItem(text: "Messages", imageName: "ellipsis.message.fill"),
        MenuItem(text: "Documents", imageName: "doc.text.fill"),
        MenuItem(text: "My Storage", imageName: "tray.full.fill")
    ]
    let toggleMenu: () -> Void
    let currentViewName: String
    var body: some View {
        ZStack {
            Color("PrimaryGreen")
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink(destination: NavbarContainerView(currentViewName: "Home") {
                    HomeView()}, tag: "Home", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "Cars") {
                    CarsView()}, tag: "Cars", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "Photos") {
                    PhotosView()}, tag: "Photos", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "Cars For Sale") {
                    CarsForSale()}, tag: "Cars For Sale", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "Messages") {
                    MessagesView()}, tag: "Messages", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "Documents") {
                    Documents()}, tag: "Documents", selection: $selection) {}
                NavigationLink(destination: NavbarContainerView(currentViewName: "My Storage") {
                    MyStorageView()}, tag: "My Storage", selection: $selection) {}
                ForEach(items) { item in
                    Button(action: { handleButtonTab(itemText: item.text) }, label: {
                        HStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("WhiteTextColor"))
                                .frame(width: 32, height: 32, alignment: .center)
                            Text(item.text)
                                .foregroundColor(Color("WhiteTextColor"))
                                .bold()
                                .font(.system(size: 22))
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    })
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .padding(.top, 35)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    let currentViewName: String
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25), value: menuOpened)
            .onTapGesture {
                self.toggleMenu()
            }
            HStack {
                MenuContent(toggleMenu: toggleMenu, currentViewName: currentViewName)
                    .frame(width: width)
                    .offset(x: menuOpened ? UIScreen.main.bounds.width - width : UIScreen.main.bounds.width + width)
                    .animation(.default, value: menuOpened)
                Spacer()
            }
        }
    }
}

struct SideMenuView: View {
    @State var menuOpened = false
    var body: some View {
        ZStack {
            if !menuOpened {
                Button(action: {
                    self.menuOpened.toggle()
                }, label: {
                    Text("Open Menu")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.mint)
                })
            }
            SideMenu(width: UIScreen.main.bounds.width/1.8, menuOpened: menuOpened,
                     toggleMenu: toggleMenu, currentViewName: "Home")
        }
        .edgesIgnoringSafeArea(.all)
    }
    func toggleMenu() {
        menuOpened.toggle()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

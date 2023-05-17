//
//  ContentView.swift
//  SideMenu
//
//  Created by Danail Dimitrov on 9.05.23.
//

import SwiftUI

struct MenuItem: Identifiable{
    var id =  UUID()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped Item")
    }
    
}

struct MenuContent: View{
    let items : [MenuItem] = [
        MenuItem(text: "Home", imageName: "house.fill"),
        MenuItem(text: "Cars", imageName: "car.2.fill"),
        MenuItem(text: "Photos", imageName: "camera.fill"),
    ]
    
    let toggleMenu: () -> Void
    
    var body: some View{
        ZStack{
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0 , alpha: 1))
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(items) { item in
                    HStack{
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width:32, height: 32, alignment: .center)
                        Text(item.text)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 22))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .onTapGesture {
                        item.handler()
                        toggleMenu()
                        
                    }
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .padding(.top, 35)
        }
    }
}

struct SideMenu: View{
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    
    var body: some View{
        ZStack{
            GeometryReader{ _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25), value: menuOpened)
            .onTapGesture{
                self.toggleMenu()
            }
            
            HStack{
                MenuContent(toggleMenu: toggleMenu)
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
                },label: {
                    Text("Open Menu")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.mint)
                })
             }
            SideMenu(width: UIScreen.main.bounds.width/1.8, menuOpened: menuOpened, toggleMenu: toggleMenu)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu(){
        menuOpened.toggle()
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

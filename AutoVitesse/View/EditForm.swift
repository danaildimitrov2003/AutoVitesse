//
//  EditForm.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 17.05.23.
//

import SwiftUI
import RealmSwift

struct EditForm: View {
    @State var userEdit = User()
    @State var showHomeView = false
    
    var body: some View {
        NavigationView {
            List {
                TextField("Username", text: $userEdit.username)
                    .disableAutocorrectAndAutocapitalize()
                    .disabled(true)
                    .foregroundColor(.gray)
                TextField("Email", text: $userEdit.email)
                    .disableAutocorrectAndAutocapitalize()
                SecureField("Password", text: $userEdit.password)
                Picker("Country", selection: $userEdit.country) {
                    ForEach(countries, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                TextField("City", text: $userEdit.city)
                    .disableAutocorrectAndAutocapitalize()
                    .fullScreenCover(isPresented: $showHomeView) {
                        NavbarContainerView{
                            HomeView()
                        }
                    }
                    .navigationTitle("Edit user data")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                saveUserEdit()
                            }
                            //.disabled(true)
                        }
                    }
                    
            }
        }
    }
}

struct EditForm_Previews: PreviewProvider {
    static var previews: some View {
        EditForm(userEdit: User())
    }
}

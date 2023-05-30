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
    @State var errorMessage = ""
    @State var isPasswordCompleted = true
    @State var isEmailCompleted = true
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                List {
                    TextField("Username", text: $userEdit.username)
                        .disableAutocorrectAndAutocapitalize()
                        .disabled(true)
                        .foregroundColor(.gray)
                    EmailTextField(email: $userEdit.email, emailState: userEdit.email, errorMessage: $errorMessage, isEmailCompleted: $isEmailCompleted)
                    PasswordTextField(password: $userEdit.password, errorMessage: $errorMessage, isPasswordCompleted: $isPasswordCompleted)
                    Picker("Country", selection: $userEdit.country) {
                        ForEach(countries, id: \.self) { option in
                            Text("\(option)")
                        }
                    }
                    TextField("City", text: $userEdit.city)
                        .disableAutocorrectAndAutocapitalize()
                    if(errorMessage != ""){
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                .navigationTitle("Edit user data")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            handleSaveButton()
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

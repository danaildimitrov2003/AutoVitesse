//
//  UserImagesList.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 26.05.23.
//

import SwiftUI
import RealmSwift

struct UserImagesList: View {
    @ObservedResults(
    userImage.self,
      where: { $0.userId == appSession.currentUser!.idString }
    ) var userImages
    
    var body: some View {
        if(userImages.count > 1){
            ForEach(userImages) { image in
                UserImageComponent(image: getImageFromName(fileName: image.imageId))
            }
        }else{
            Text("There are no photos")
                .font(.title)
        }
        
    }
}

struct UserImagesList_Previews: PreviewProvider {
    static var previews: some View {
        UserImagesList()
    }
}

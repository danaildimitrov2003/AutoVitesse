//
//  PhotosViewExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 26.05.23.
//

import Foundation
import UIKit
import RealmSwift

extension PhotosView{
    
    func saveImageLocally(image: UIImage, fileName: String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent(fileName)
        if let data = image.pngData() {
            do {
                try data.write(to: url)
                let realm = try Realm(configuration: config)
                realm.safeWrite {
                    let image = userImage()
                    guard let userId = appSession.currentUser?.idString else {
                        return
                    }
                    image.userId = userId
                    image.imageId = fileName
                    realm.add(image)
                }
            } catch {
                print("Unable to Write \(fileName) Image Data to Disk")
            }
        }
    }
}

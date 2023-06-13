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
    
    func saveImage(image: UIImage) {
        let utils = Utils()
        let fileName = UUID().uuidString
        utils.saveImageLocally(image: image, fileName: fileName)
            do {
                let realm = try Realm(configuration: config)
                realm.safeWrite {
                    let image = userImage()
                    image.userId = utils.getCurrentUser().idString
                    image.imageId = fileName
                    realm.add(image)
                }
            } catch {
                print("Unable to save image to Realm")
            }
        }
    }


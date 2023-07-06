//
//  MyStorageExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 5.07.23.
//

import Foundation
import SwiftyDropbox

extension MyStorageView{
    
    func uploadFileToDropBox(){
        if let client = DropboxClientsManager.authorizedClient {
            guard let importedFile = importedFile else {
                print("Error: importedFile is nil")
                return
            }
            let request = client.files.upload(path: "/AutoVitesse/\(fileName)", input: importedFile)
                .response { response, error in
                    if let response = response {
                        print(response)
                    } else if let error = error {
                        print(error)
                    }
                }
                .progress { progressData in
                    print(progressData)
                }
            
        } else {
            print("Error: Dropbox client is nil")
        }
    }
    
    func logOutOfDropBox(){
        isLogedIn = false
        DropboxClientsManager.unlinkClients()
        fileName = ""
        importedFile = nil
    }
}

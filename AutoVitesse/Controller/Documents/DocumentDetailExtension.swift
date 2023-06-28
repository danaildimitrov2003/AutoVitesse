//
//  DocumentDetailExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 28.06.23.
//

import Foundation
import PDFNet

extension DocumentDetailView{
    
    func checkIfFileExist(fileName : String){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("/\(fileName)-\(utils.getCurrentUser().idString).pdf") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
            } else {
                let docPath = Bundle.main.path(forResource: fileName, ofType: "pdf")
                let doc = PTPDFDoc(filepath: docPath)
                let modifiedDocPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                    .appending("/\(fileName)-\(utils.getCurrentUser().idString).pdf")
                doc?.save(toFile: modifiedDocPath, flags: e_ptlinearized.rawValue)
                print("FILE NOT AVAILABLE")
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
    }
    
}

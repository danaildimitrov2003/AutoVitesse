//
//  DocumentDetailExtension.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 28.06.23.
//

import Foundation
import PDFNet
import RealmSwift

extension DocumentDetailView {
    func checkIfFileExist(fileName: String) {
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
    func exportAnnotationsToXFDF(fileName: String) {
        do {
            try PTPDFNet.catchException {
                let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                    .appending("/\(fileName)-\(utils.getCurrentUser().idString).pdf")
                let doc = PTPDFDoc(filepath: path)
                doc?.initSecurityHandler()
                let fdoc_new: PTFDFDoc = (doc?.fdfExtract(e_ptboth))!
                let XFDF_str: String = fdoc_new.saveAsXFDFToString()
                self.saveOrUpdateAnnotationToRealm(userId: utils.getCurrentUser().idString,
                                                   fileName: fileName, newXfdfString: XFDF_str)
                print("Annotations exported to XFDF successfully.")
                do {
                    try FileManager.default.removeItem(atPath: path)
                    print("PDF file deleted successfully.")
                } catch {
                    print("Error deleting PDF file: \(error)")
                }
            }
        } catch let e as NSError {
            print("\(e)")
        }
    }
    func mergeXFDFIntoPDF(fileName: String) {
        do {
            let realm = try Realm(configuration: config)
            try PTPDFNet.catchException {
                let docPath = Bundle.main.path(forResource: fileName, ofType: "pdf")
                let doc = PTPDFDoc(filepath: docPath)
                doc?.initSecurityHandler()
                if let existingAnnotation = realm.objects(Annotation.self).filter("userId == %@ AND fileName == %@",
                                                                                  utils.getCurrentUser().idString,
                                                                                  fileName).first {
                    doc?.mergeXFDF(with: existingAnnotation.xfdfString, opts: nil)
                }
                doc?.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory,
                    .userDomainMask, true)[0])
                    .appendingPathComponent("/\(fileName)-\(utils.getCurrentUser().idString).pdf")
                    .path, flags: e_ptlinearized.rawValue)
                print("XFDF data merged into PDF successfully.")
            }
        } catch let e as NSError {
            print("\(e)")
        }
    }
    func saveOrUpdateAnnotationToRealm(userId: String, fileName: String, newXfdfString: String) {
        do {
            let realm = try Realm(configuration: config)
            guard let existingAnnotation = realm.objects(Annotation.self).filter("userId == %@ AND fileName == %@",
                                                                                 userId, fileName).first else {
                let newAnnotation = Annotation()
                newAnnotation.userId = userId
                newAnnotation.fileName = fileName
                newAnnotation.xfdfString = newXfdfString
                do {
                    try realm.write {
                        realm.add(newAnnotation)
                    }
                } catch {
                    print("Failed to save new annotation to Realm: \(error)")
                }
                return
            }
            do {
                try realm.write {
                    existingAnnotation.xfdfString = newXfdfString
                }
            } catch {
                print("Failed to update existing annotation in Realm: \(error)")
            }
        } catch {
            print("Failed to initialize Realm: \(error)")
        }
    }
}

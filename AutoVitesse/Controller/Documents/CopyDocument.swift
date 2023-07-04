//
//  CopyDocument.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 30.06.23.
//

import Foundation
import PDFNet

extension CopyDocumentView{
    
    func createCopy(fileName : String){
        let numOfpagesInt = 1
        
        do {
            try PTPDFNet.catchException {
                let in_doc: PTPDFDoc = PTPDFDoc(filepath: Bundle.main.path(forResource: fileName, ofType: "pdf"))
                in_doc.initSecurityHandler()
                
                var page_num = in_doc.getPageCount()
                while page_num > numOfpagesInt{
                    if !selectedNumbers.contains(Int(page_num)) {
                        let itr: PTPageIterator = in_doc.getPageIterator(UInt32(page_num))
                        in_doc.pageRemove(itr)
                    }
                    
                    page_num -= 1
                }
                
                in_doc.save(toFile: URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("\(fileName)-Copy.pdf").path, flags: 0)
                print("Done. Result saved")
            }
        } catch let e as NSError {
            print("\(e)")
        }
    }
    
    func getPDFPagesNum(fileName : String) -> Int{
        var pageNum = 0
        do {
            try PTPDFNet.catchException {
                let in_doc: PTPDFDoc = PTPDFDoc(filepath: Bundle.main.path(forResource: fileName, ofType: "pdf"))
                in_doc.initSecurityHandler()
                
                pageNum = Int(in_doc.getPageCount())
            }
        } catch let e as NSError {
            print("\(e)")
        }
        print(pageNum)
        return pageNum
    }
    
    func selectAllPages(){
        isSelectAllChecked.toggle()
        if isSelectAllChecked {
            selectedNumbers = Array(1...pageCount)
        } else {
            selectedNumbers.removeAll()
        }
        
        print(selectedNumbers)
    }
}

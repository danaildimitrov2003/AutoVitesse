import SwiftUI
import PDFNet
import Tools

struct DocumentView: UIViewControllerRepresentable {
    let fileName: String
    let utils = Utils()
    
    func makeUIViewController(context: Context) -> UIViewController {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "pdf") else {
            fatalError("PDF file not found in the bundle.")
        }
//        let modifiedDocPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//            .appending("/\(fileName)-\(utils.getCurrentUser().idString).pdf")
//        let fileURL = URL(fileURLWithPath: modifiedDocPath)
        let documentController = PTDocumentController()
        let navigationController = UINavigationController(rootViewController: documentController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isTranslucent = false
        navigationController.toolbar.isTranslucent = false
        
        documentController.openDocument(with: fileURL)
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct DocumentDetailView: View {
    let fileName: String
    let utils = Utils()
    
    init(fileName: String) {
        self.fileName = fileName
        //utils.checkIfFileExist(fileName: fileName)
        //checkIfFileExist(fileName: fileName)
        utils.mergeXFDFIntoPDF(fileName: fileName)
    }
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            DocumentView(fileName: fileName)
                .onDisappear(){
                    utils.exportAnnotationsToXFDF(fileName: fileName)
                }
        }
    }
}


struct DocumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDetailView(fileName: "sample")
    }
}

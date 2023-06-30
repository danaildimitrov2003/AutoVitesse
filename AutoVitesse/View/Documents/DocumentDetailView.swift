import SwiftUI
import PDFNet
import Tools

struct DocumentView: UIViewControllerRepresentable {
    let fileName: String
    let utils = Utils()
    
    func makeUIViewController(context: Context) -> UIViewController {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            .appending("/\(fileName)-\(utils.getCurrentUser().idString).pdf")
        let fileURL = URL(fileURLWithPath: docPath)
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
        utils.mergeXFDFIntoPDF(fileName: fileName)
    }
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea(.all)
            DocumentView(fileName: fileName)
                .onDisappear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        utils.exportAnnotationsToXFDF(fileName: fileName)
                    }
                }
        }
    }
}


struct DocumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDetailView(fileName: "sample")
    }
}

import SwiftUI
import PDFNet
import Tools

struct DocumentDetailView: UIViewControllerRepresentable {
    let fileName: String
    
    func makeUIViewController(context: Context) -> UIViewController {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "pdf") else {
            fatalError("PDF file not found in the bundle.")
        }
        
        let documentController = PTDocumentController()
        let navigationController = UINavigationController(rootViewController: documentController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isTranslucent = false
        navigationController.toolbar.isTranslucent = false
        
        documentController.openDocument(with: fileURL)
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}

struct DocumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentDetailView(fileName: "sample")
    }
}

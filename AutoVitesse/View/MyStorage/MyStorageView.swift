//
//  MyStorageView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 5.07.23.
//

import SwiftUI
import SwiftyDropbox


struct MyStorageView: View {
    
    @State var isShown = false
    @State var showUploadButton = false
    @State var showFileImporter = false
    @State var fileName = ""
    @State var importedFile : Data?
    
    var body: some View {
        VStack {
            
            Button(action: {
                self.isShown.toggle()
            }) {
                Text("Login to Dropbox")
            }
            Button("Import File") {
                showFileImporter.toggle()
            }
            .fileImporter(
                isPresented: $showFileImporter,
                allowedContentTypes: [.pdf]
            ) { result in
                switch result {
                case .success(let file):
                    print(file.absoluteString)
                    do{
                        importedFile = try Data(contentsOf: file)
                        fileName = try result.get().lastPathComponent
                    }catch{
                        print("Error: \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            Text(fileName)
                .font(.title3)
            if (DropboxClientsManager.authorizedClient != nil || showUploadButton) {
                Button {
                    uploadFileToDropBox()
                } label: {
                    Text("Upload file")
                }
            }
            DropboxView(isShown: $isShown)
        }
        .onOpenURL { url in
            let oauthCompletion: DropboxOAuthCompletion = {
                if let authResult = $0 {
                    switch authResult {
                    case .success:
                        print("Success! User is logged into DropboxClientsManager.")
                    case .cancel:
                        print("Authorization flow was manually canceled by user!")
                    case .error(_, let description):
                        print("Error: \(String(describing: description))")
                    }
                }
            }
            DropboxClientsManager.handleRedirectURL(url, completion: oauthCompletion)
        }
    }
}

struct DropboxView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var isShown : Bool
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if isShown {
            let scopeRequest = ScopeRequest(scopeType: .user, scopes: ["account_info.read", "files.metadata.write", "files.metadata.read", "files.content.write", "files.content.read"], includeGrantedScopes: false)
            DropboxClientsManager.authorizeFromControllerV2(
                UIApplication.shared,
                controller: uiViewController,
                loadingStatusDelegate: nil,
                openURL: { (url: URL) -> Void in UIApplication.shared.open(url, options: [:], completionHandler: nil) },
                scopeRequest: scopeRequest)
        }
    }
    
    func makeUIViewController(context _: Self.Context) -> UIViewController {
        return UIViewController()
    }
}

struct MyStorageView_Previews: PreviewProvider {
    static var previews: some View {
        MyStorageView()
    }
}

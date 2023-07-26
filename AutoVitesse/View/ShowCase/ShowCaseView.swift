//
//  ShowCaseView.swift
//  AutoVitesse
//
//  Created by Danail Dimitrov on 25.07.23.
//

import SwiftUI
import Combine

class ImageFetcher: ObservableObject {
    let fetchImagePublisher = PassthroughSubject<String, Error>()
    var subscriptions = Set<AnyCancellable>()
    let env =  Environment()
    @Published var savedImageURLs: [URL] = []
    init() {
        setUpSubriber()
    }
}

struct ShowCaseView: View {
    @StateObject var imageFetcher = ImageFetcher()
    @State var searchPrompt = ""
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack {
                Button(action: { self.imageFetcher.fetchUnsplashPhotos(for: searchPrompt) }, label: {
                    Text("Fetch images")
                        .padding()
                        .background(searchPrompt.count < 2 ? .gray : Color("AccentColor"))
                        .foregroundColor(Color("WhiteTextColor"))
                        .cornerRadius(10)
                })
                .disabled(searchPrompt.count < 2 ? true : false)
                TextField("search for a car", text: $searchPrompt)
                    .foregroundColor(Color("BlackTextColor"))
                    .padding()
                    .background(Color("PrimaryGreen"))
                    .cornerRadius(10)
                    .padding()
                ScrollView {
                    ForEach(imageFetcher.savedImageURLs.reversed(), id: \.self) { imageUrl in
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                        .padding()
                    }
                }
            }
        }
    }
}

struct ShowCaseView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCaseView()
    }
}

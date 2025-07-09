//
//  StoriesView.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesView: View {
    @ObservedObject var viewModel = StoriesViewModel()
    
    var body: some View {
        List(viewModel.storyPosts) { storyPost in
            ZStack {
                WebImage(url: storyPost.imageURL)  { image in
                    image.resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch)
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-73)

                VStack() {
                    Text("test")
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundColor(.primary)
                    
                    Spacer()

                    Text(storyPost.content)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.init(top: 16, leading: 16, bottom: 60, trailing: 16))
            }
        }
        .padding(0)
        .contentMargins(0)
        .background(.black)
        .listStyle(PlainListStyle())
        .listSectionSeparator(.hidden)
        .listRowSeparator(.hidden)
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchStoryPosts(after: 0)
                }
            }
        }
    }
}

#Preview {
    StoriesView().environmentObject(StoriesViewModel())
}

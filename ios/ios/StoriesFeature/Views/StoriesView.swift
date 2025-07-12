//
//  StoriesView.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesView: View {
    @StateObject private var viewModel = StoriesViewModel()
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        List(viewModel.storyPosts) { storyPost in
            StoryView(storyPost)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(PlainListStyle())
        .overlay(
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                }
            }
        )
        .alert("Error", isPresented: .constant(errorMessage != nil)) {
            Button("OK") {
                errorMessage = nil
            }
        } message: {
            Text(errorMessage ?? "")
        }
        .onAppear {
            loadStoryPosts()
        }
        .padding(.top, 1)
        .background(.black)
    }
    
    private func loadStoryPosts() {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                try await viewModel.fetchStoryPosts(after: 0)
                await MainActor.run {
                    isLoading = false
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview {
    StoriesView()
}

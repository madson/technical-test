//
//  StoriesViewModel.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI

final class StoriesViewModel: ObservableObject {
    @Published var storyPosts: [StoryPost] = []
    
    private let storyPostRepository = StoryPostRepository()
    
    func fetchStoryPosts(after timestamp: Int) async throws {
        do {
            let storyPosts = try await storyPostRepository.fetchStoryPosts(after: timestamp)
            self.storyPosts.append(contentsOf: storyPosts)
        } catch {
            throw error
        }
    }
}

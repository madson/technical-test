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
            let users = try await UserRepository().fetchUsers()
            let storyPostsCopy = storyPosts.map { story in
                var local = story
                local.user = users.first(where: { story.id == $0.id })
                return local
            }
            await MainActor.run {
                self.storyPosts.append(contentsOf: storyPostsCopy)
            }
        } catch {
            throw error
        }
    }
}

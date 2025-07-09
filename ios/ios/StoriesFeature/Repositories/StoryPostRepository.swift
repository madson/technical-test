//
//  StoryPostRepository.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import Foundation

final class StoryPostRepository {
    
    func fetchStoryPosts(after timestamp: Int) async throws -> [StoryPost] {
        guard let url = Bundle.main.url(forResource: "story_posts", withExtension: "json") else {
            throw StoryPostRepositoryError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(StoryPostResponse.self, from: data)
            
            let allStoryPosts = response.pages.flatMap { $0.storyPosts }
            return allStoryPosts
        } catch {
            throw StoryPostRepositoryError.decodingError(error)
        }
    }
}

enum StoryPostRepositoryError: Error {
    case fileNotFound
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "story_posts.json file not found in bundle"
        case .decodingError(let error):
            return "Failed to decode JSON: \(error.localizedDescription)"
        }
    }
}

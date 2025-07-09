//
//  StoryPostPage.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import Foundation

struct StoryPostPage: Codable {
    let storyPosts: [StoryPost]
    
    enum CodingKeys: String, CodingKey {
        case storyPosts = "story_posts"
    }
}

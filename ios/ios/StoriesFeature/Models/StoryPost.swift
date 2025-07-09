//
//  StoryPost.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import Foundation

struct StoryPost: Codable, Identifiable {
    let id: Int
    let userId: Int
    let content: String
    let imageURL: URL
    let timestamp: Int
    let likesCount: Int
    let commentsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case content
        case imageURL = "image_url"
        case timestamp
        case likesCount = "likes_count"
        case commentsCount = "comments_count"
    }
}

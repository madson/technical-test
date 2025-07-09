//
//  User.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let profilePictureUrl: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureUrl = "profile_picture_url"
    }
}

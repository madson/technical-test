//
//  UserRepository.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import Foundation

final class UserRepository {
    
    func fetchUsers() async throws -> [User] {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            throw UserRepositoryError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(UserResponse.self, from: data)
            
            let allUsers = response.pages.flatMap { $0.users }
            return allUsers
        } catch {
            throw UserRepositoryError.decodingError(error)
        }
    }
}

enum UserRepositoryError: Error {
    case fileNotFound
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "users.json file not found in bundle"
        case .decodingError(let error):
            return "Failed to decode JSON: \(error.localizedDescription)"
        }
    }
}

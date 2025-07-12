//
//  ProfilePicture.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilePicture: View {
    private let profilePicture: URL
    private let insets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    init(_ pictureURL: URL) {
        self.profilePicture = pictureURL
    }

    var body: some View {
        WebImage(url: profilePicture)  { image in
            image.resizable(capInsets: insets, resizingMode: .stretch)
        } placeholder: {
            Rectangle().foregroundColor(.gray)
        }
        .scaledToFill()
        .cornerRadius(20)
        .frame(width: 40, height: 40)
        .shadow(radius: 5)
    }
}

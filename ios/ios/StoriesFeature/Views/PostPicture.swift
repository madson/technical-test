//
//  PostPicture.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostPicture: View {
    private let postPicture: URL
    
    init(_ pictureURL: URL) {
        self.postPicture = pictureURL
    }
    
    var body: some View {
        WebImage(url: postPicture)  { image in
            image.resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch)
        } placeholder: {
            Rectangle().foregroundColor(.gray)
        }
        .scaledToFill()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-50)
    }
}

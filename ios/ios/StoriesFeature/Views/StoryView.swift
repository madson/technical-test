//
//  StoryView.swift
//  ios
//
//  Created by Madson Cardoso on 7/9/25.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreHaptics

struct StoryView: View {
    let storyPost: StoryPost;
    @State var liked: Bool = false
    
    init(_ storyPost: StoryPost) {
        self.storyPost = storyPost
    }

    var body: some View {
        ZStack {
            PostPicture(storyPost.imageURL)

            VStack(spacing: 40) {
                HStack() {
                    ProfilePicture(storyPost.user!.profilePictureUrl)
                    
                    Text(storyPost.user?.name ?? "username")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.9))
                        .shadow(color: Color.black, radius: 10, x: 0, y: 0)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
                
                HStack() {
                    Spacer()
                    VStack(spacing: 30) {
                        VStack(spacing: 8) {
                            Image(systemName: liked ? "heart.fill" : "heart")
                                .foregroundStyle(liked ? Color.red : Color.white)
                                .font(.system(size: 30))
                                .fontWeight(.light)
                                .onTapGesture {
                                    withAnimation {
                                        liked.toggle()
                                    }
                                }
                                .sensoryFeedback(.impact, trigger: liked)
                            Text("\(storyPost.likesCount!)")
                                .foregroundStyle(Color.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        
                        VStack(spacing: 8) {
                            Image(systemName: "bubble.right")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 28))
                                .fontWeight(.light)
                            Text("\(storyPost.commentsCount!)")
                                .foregroundStyle(Color.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }

                        VStack(spacing: 8) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 30))
                                .fontWeight(.light)
                            Text("\(storyPost.sharesCount!)")
                                .foregroundStyle(Color.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                    .shadow(color: Color.black, radius: 10, x: 0, y: 0)
                }

                Text(storyPost.content)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white.opacity(0.9))
                    .shadow(color: Color.black, radius: 10, x: 0, y: 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            .padding(.bottom, 40)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    let user = User(
        id: 1,
        name: "Madson Cardoso",
        profilePictureUrl: URL(string: "https://i.pravatar.cc/300?u=1")!
    )
    
    let storyPost = StoryPost(
        id: 1,
        userId: 1,
        content: "Training with Morpheus today. Learning to bend the spoon... or should I say, there is no spoon?",
        imageURL: URL(string: "https://images.unsplash.com/photo-1579047917338-a6a69144fe63?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3NzU0MTZ8MHwxfHNlYXJjaHwzfHxoYXBweSUyMHBlcnNvbnxlbnwwfHx8fDE3NTIwNzIyNzh8MA&ixlib=rb-4.1.0&q=80&w=1080")!,
        timestamp: 1,
        likesCount: 4882,
        commentsCount: 132,
        sharesCount: 28,
        user: user
    )
    
    StoryView(storyPost)
}

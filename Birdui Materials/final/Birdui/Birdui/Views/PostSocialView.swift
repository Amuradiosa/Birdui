//
//  PostSocialView.swift
//  Birdui
//
//  Created by Ahmad Murad on 15/07/2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostSocialView: View {
  
  @Binding var post: MediaPost

  
  var body: some View {
    HStack {
      
      Button(action: {
        withAnimation {
          self.post.isLiked.toggle()
        }
      }) {
        Text(verbatim: "Like 👍")
          .foregroundColor(Color.primary)
          .padding([.leading, .trailing], 10)
          .padding([.top, .bottom], 5)
          .opacity(self.post.isLiked ? 1 : 0.5)
          .saturation(self.post.isLiked ? 1 : 0.5)
      }
      
      Picker("Reaction", selection: $post.reaction) {
        ForEach(Reaction.allCases, id: \.self) { reaction in
          Text(reaction.rawValue).tag(reaction)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      
    }
    .padding([.leading, .trailing])
  }
}


struct PostSocialView_Previews: PreviewProvider {
    static var previews: some View {
      PostSocialView(post: .constant(MediaPost(textBody: "Went to the Aquarium today :]",
      userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus"), isLiked: true)))
    }
}

//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  @Binding var post: MediaPost
  
  let imageSize: CGFloat = 200
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Image("mascot")
          .resizable()
          .frame(width: 50, height: 50, alignment: .leading)
        VStack(alignment: .leading) {
          Text(post.userName)
            .font(.headline)
          Text(post.timestamp.string)
            .font(.caption)
        }
      }
      
      Text(post.textBody != nil ? post.textBody! : "")
      if post.uiImage != nil {
        Image(uiImage: post.uiImage!)
          .resizable()
          .frame(width: imageSize, height: imageSize)
      }
    }
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: .constant(MediaPost(textBody: "Went to the Aquarium today :]",
                                       userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                                       uiImage: UIImage(named: "octopus"))))
  }
}

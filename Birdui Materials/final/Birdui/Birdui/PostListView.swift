//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  
  @ObservedObject var postViewModel: PostViewModel
  @State var createModalIsPresented = false
  //  @State var editModalIsPresented = false
  
  var body: some View {
    Form {
      VStack {
        HStack {
          Image("mascot")
            .resizable()
            .frame(width: 50, height: 50, alignment: .leading)
          Text("Home")
            .bold()
            .font(.title)
        }
        
        Button("Create New Post") {
          self.createModalIsPresented = true
        }
      }
      
      List(postViewModel.posts) { post in
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
              .frame(width: 150, height: 150)
          }
        }
      }

    }
    .sheet(isPresented: $createModalIsPresented) {
      NewPostView(postHandler: self.postViewModel)
    }
    
    // TODO: This should look exactly like the Birdie table view,
    // but with only one button.
    //    Text("Layout header, new-post button, List of posts")
    
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView(postViewModel: PostViewModel())
  }
}

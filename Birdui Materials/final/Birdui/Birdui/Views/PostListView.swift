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
    VStack(alignment: .leading) {
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
      .padding()
      
      List(postViewModel.posts) { post in
        PostView(post: .constant(post))
      }

    }
    .sheet(isPresented: $createModalIsPresented) {
      NewPostView(postHandler: self.postViewModel)
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView(postViewModel: PostViewModel())
  }
}

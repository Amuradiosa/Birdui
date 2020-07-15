//
//  AppDelegate.swift
//  Birdui
//
//  Created by Audrey Tam on 3/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

struct MediaPost: Identifiable {
  let id = UUID()
  let textBody: String?
  let userName: String
  let timestamp: Date
  let uiImage: UIImage?
  var isLiked: Bool = false
  var reaction: Reaction = .love
}

enum Reaction: String, CaseIterable {
  case love = "😻"
  case funny = "😹"
  case unsure = "😿"
  case shock = "🙀"
}

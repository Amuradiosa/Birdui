//
//  DateExtension.swift
//  Birdui
//
//  Created by Ahmad Murad on 12/07/2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

extension Date {
  
  // Get string representation form date
  var string: String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_GB")
    formatter.setLocalizedDateFormatFromTemplate("MMMd, HH:mm")
    return formatter.string(from: self)
  }
}

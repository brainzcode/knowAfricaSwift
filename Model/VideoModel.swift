//
//  VideoModel.swift
//  WildLife
//
//  Created by SOG on 5/18/22.
//

import SwiftUI

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // COMPUTED PROPERTY
  var thumbnail: String {
    "video-\(id)"
  }
}

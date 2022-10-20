//
//  CenterModifier.swift
//  WildLife
//
//  Created by SOG on 5/20/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}

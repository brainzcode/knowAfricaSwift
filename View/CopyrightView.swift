//
//  CopyrightView.swift
//  WildLife
//
//  Created by SOG on 5/20/22.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
      VStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 128, height: 128)
        Text("""
      Copyright © Samuel Godfrey
      All right reserved
      Better Apps ♡ Less Code
     """)
          .font(.footnote)
        .multilineTextAlignment(.center)
      } // VSTACK
      .padding()
      .opacity(0.5)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

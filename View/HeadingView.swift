//
//  HeadingView.swift
//  knowAfrica
//
//  Created by SOG on 5/18/22.
//

import SwiftUI

struct HeadingView: View {
//  PROPERTIES
  
  var headingImage: String
  var headingText: String
  
//  BODY
  
    var body: some View {
      HStack {
        Image(systemName: headingImage)
          .foregroundColor(.accentColor)
          .imageScale(.large)
        
        Text(headingText)
          .font(.title)
          .fontWeight(.bold)
      } // HSTACK
      .padding(.vertical)
    }
}

//  PREVIEW

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
      HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

//
//  VideoList.swift
//  WildLife
//
//  Created by SOG on 5/18/22.
//

import SwiftUI

struct VideoList: View {
  // PROPERTIES
  
  let video: Video
  
  // BODY
  
  
    var body: some View {
      HStack(spacing: 10) {
        ZStack {
          Image(video.thumbnail)
            .resizable()
            .scaledToFit()
            .frame(height: 80)
          .cornerRadius(9)
          
          Image(systemName: "play.rectangle")
            .resizable()
            .scaledToFit()
            .frame(height: 32)
            .shadow(radius: 4)
        } // ZSTACK
        
        VStack(alignment: .leading, spacing: 10) {
          Text(video.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
          
          Text(video.headline)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
        }
      } // HSTACK
    }
}

struct VideoList_Previews: PreviewProvider {
  static let videos: [Video] = Bundle.main.decode("videos.json")
  
   static var previews: some View {
     VideoList(video: videos[0])
       .previewLayout(.sizeThatFits)
       .padding() 
    }
}

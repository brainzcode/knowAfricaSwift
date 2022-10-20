//
//  VideoListView.swift
//  knowAfrica
//
//  Created by SOG on 5/17/22.
//

import SwiftUI

struct VideoListView: View {
  // PROPERTIES
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // BODY
    var body: some View {
      NavigationView {
        List {
          ForEach(videos) { item in
            NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
              VideoList(video: item)
                .padding(.vertical, 8)
            }
          } // LOOP
        } // LIST
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Videos", displayMode: .inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              // SHUFFLE VIDEOS
              videos.shuffle()
              hapticImpact.impactOccurred()
            }) {
              Image(systemName: "arrow.2.squarepath")
            }
          }
        }
      } // NAVIGATION
    }
}

// PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

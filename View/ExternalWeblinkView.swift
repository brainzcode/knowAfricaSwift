//
//  ExternalWeblinkView.swift
//  WildLife
//
//  Created by SOG on 5/18/22.
//

import SwiftUI

struct ExternalWeblinkView: View {
  // PROPERTIES
  
  let animal: Animal
  
  // BODY
  
    var body: some View {
      GroupBox {
        HStack {
          Image(systemName: "globe")
          Text("Wikipedia")
          Spacer()
          
          Group {
            Image(systemName: "arrow.up.right.square")
            
            Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
          }
          .foregroundColor(.accentColor)
        } // HSTACK
      } // HSTACK
    }
}

// PREVIEW

struct ExternalWeblinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
      ExternalWeblinkView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

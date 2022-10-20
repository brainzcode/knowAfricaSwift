//
//  InsertFactView.swift
//  WildLife
//
//  Created by SOG on 5/18/22.
//

import SwiftUI

struct InsertFactView: View {
  // PROPERTIES
  
  let animal: Animal
  
  // BODY
  
    var body: some View {
      GroupBox {
        TabView {
          ForEach(animal.fact, id: \.self) { item in
            Text(item)
          }
        } // TABS
        .tabViewStyle(PageTabViewStyle())
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
      } // BOX
    }
}

// PREVIEW

struct InsertFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
    static var previews: some View {
      InsertFactView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

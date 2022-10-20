//
//  AnimalGridItemView.swift
//  WildLife
//
//  Created by SOG on 5/20/22.
//

import SwiftUI

struct AnimalGridItemView: View {
  //  PROPERTIES
  
  let animal: Animal
  
  //  BODY
  
    var body: some View {
      Image(animal.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(12)
    }
}

  //  PREVIEW

struct AnimalGridItemView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
    static var previews: some View {
      AnimalGridItemView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

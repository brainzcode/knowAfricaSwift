//
//  ContentView.swift
//  knowAfrica
//
//  Created by SOG on 5/17/22.
//

import SwiftUI

struct ContentView: View {
  //  PROPERTIES
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColunm: Int = 1
  @State private var toolBarIcon: String = "square.grid.2x2"
  
  // FUNCTIONS
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColunm = gridLayout.count
    print("Grid Number: \(gridColunm)")
    
    // TOOLBAR IMAGE
    switch gridColunm {
    case 1:
      toolBarIcon = "rectangle.grid.1x2"
    case 2:
      toolBarIcon = "square.grid.2x2"
    case 3:
      toolBarIcon = "square.grid.3x2"
    default:
      toolBarIcon = "square.grid.2x2"
    }
  }
  
  var body: some View {
      
      //  BODY
      NavigationView {
        Group {
          if !isGridViewActive {
            List {
              CoverImageView()
                .frame(height: 300)
              //            .listRowInsets(.init())
              //            .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              
              ForEach(animals) {animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalListItemView(animal: animal)
                } // LINK
              } // LOOP
              
              CopyrightView()
                .modifier(CenterModifier())
            } // LIST
          } else {
            ScrollView(.vertical, showsIndicators: false) {
              LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { animal in
                  NavigationLink(destination: AnimalDetailView(animal: animal)) {
                    AnimalGridItemView(animal: animal)
                  } // LINK
                } // LOOP
              } // LAZYGRID
              .padding(10)
              .animation(.easeIn)
            } // SCROLL
          } // CONDITION
        } // GROUP
        
        .navigationBarTitle("WildLIfe", displayMode: .large)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 16) {
              // LIST
              Button(action: {
                print("List view is activated")
                isGridViewActive = false
                haptics.impactOccurred()
              }) {
                Image(systemName: "square.fill.text.grid.1x2")
                  .font(.title2)
                  .foregroundColor(isGridViewActive ? .primary : .accentColor)
              }
              
              // GRID
              Button(action: {
                print("Grid view is activated")
                isGridViewActive = true
                haptics.impactOccurred()
                gridSwitch()
              }) {
                Image(systemName: toolBarIcon)
                  .font(.title2)
                  .foregroundColor(isGridViewActive ? .accentColor : .primary)
              }
            } // HSTACK
          } // BUTTON
        } // TOOLBAR
      } // NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }
}

//  PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

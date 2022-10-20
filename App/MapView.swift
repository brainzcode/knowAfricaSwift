//
//  MapView.swift
//  knowAfrica
//
//  Created by SOG on 5/17/22.
//

import SwiftUI
import MapKit

struct MapView: View {
  // PROPERTIES
  
  @State private var region: MKCoordinateRegion = {
    var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  // BODY
  
    var body: some View {
      // BASIC MAP
      Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
        // (A) PIN: OLD STYLE (always static)
//        MapPin(coordinate: item.location, tint: .accentColor)
        
        // (B) MARKER: NEW STYLE (always static)
//        MapMarker(coordinate: item.location, tint: .accentColor)
        
        // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//        MapAnnotation(coordinate: item.location) {
//          Image("logo")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 25, height: 25, alignment: .center)
//        } // ANNOTATION
        
        // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
        MapAnnotation(coordinate: item.location) {
          MapAnnotationView(location: item)
        }
      }) // MAP
      .overlay(
        HStack(alignment: .center, spacing: 12) {
          Image("compass")
            .resizable()
            .scaledToFit()
          .frame(width: 40, height: 40, alignment: .center)
          
          VStack(alignment: .leading, spacing: 3) {
            HStack {
              Text("Latitude")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              Spacer()
              Text("\(region.center.latitude)")
                .font(.footnote)
                .foregroundColor(.white)
            }
            
            Divider()
            
            HStack {
              Text("Longitude")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              Spacer()
              Text("\(region.center.longitude)")
                .font(.footnote)
                .foregroundColor(.white)
            }
          }
        } // HSTACK
          .padding(.vertical, 12)
          .padding(.horizontal, 16)
          .background(
            Color.black
              .cornerRadius(10)
              .opacity(0.6)
          )
          .padding()
        , alignment: .top
      )

    }
}

// PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

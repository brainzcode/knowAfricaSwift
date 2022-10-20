//
//  CodableBundleExtension.swift
//  knowAfrica
//
//  Created by SOG on 5/17/22.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. Loacte the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle")
    }
    
    // 2. Create a property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) in bundle")
    }
    
    // 3. Create a decoder
    let decoder = JSONDecoder()
    
    // 4. Create a property for the decoded data
    do {
      let loaded = try decoder.decode(T.self, from: data)
      return loaded
    } catch {
      print(error)
      fatalError(error.localizedDescription)
    }
    
    // 5. Return the ready-to-use data
//    return loaded as! T
  }
}

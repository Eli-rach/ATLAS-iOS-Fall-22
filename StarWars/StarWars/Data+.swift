//
//  Data+.swift
//  StarWars
//
//  Created by Charlie Nevitt on 9/28/22.
//

import Foundation

extension Data {
    func readLocalFile(forName name: String) -> Data? {
          do {
              if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                 let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                  return jsonData
              }
          } catch {
              print("Couldn't read JSON", error)
          }
          
          return nil
      }
}

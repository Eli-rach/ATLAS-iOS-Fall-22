//
//  Person.swift
//  StarWars
//
//  Created by Charlie Nevitt on 9/28/22.
//

import Foundation

struct Person: Codable{
    var name: String
    //    var height: Int
    //    var mass: Int
    static var luke: Person {
      
        
        if let data = Data.readLocalFile(forName: "luke"){
            let decoder = JSONDecoder()

            do {
                let people = try decoder.decode(Person.self, from: data)
                print("Here's Luke's Name: ", luke.name)
            } catch {
                print(error.localizedDescription)
            }
            print("We got data")
        }
        
        return Person(name: "Luke Skywalker")
    }
}




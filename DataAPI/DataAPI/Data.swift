//
//  Data.swift
//  DataAPI
//
//  Created by Charlie Nevitt on 10/5/22.
//

import Foundation

struct Post: Codable, Identifiable {
    let id = UUID()
    let anime: String
    let character: String
    let quote: String
}

class Api{
    func getPosts(completion: @escaping (Post) -> ()){
        guard let url = URL(string: "https://animechan.vercel.app/api/random") else {return}
        
        URLSession.shared.dataTask(with: url) {(data, _, _) in
            let postReturn = try! JSONDecoder().decode(Post.self, from: data!)
    //        print(postReturn)
                DispatchQueue.main.async {
                    completion(postReturn)
                }
        }
        .resume()
    }
}

import UIKit

var greeting = "Hello, playground"


struct Post: Codable, Identifiable {
    let id = UUID()
    let anime: String
    let character: String
    let quote: String
}


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
var posts: Post = (Post(anime: "", character: "", quote: ""))

var returnAPI = getPosts { postReturn in
    posts = postReturn
    print(posts.anime)
    print(posts.character)
    print(posts.quote)
    
}

print(returnAPI)

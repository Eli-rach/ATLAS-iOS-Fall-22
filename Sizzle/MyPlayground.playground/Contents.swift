import UIKit

var currentKey = "Apple Blueberry"


///What I need: Label, image, ingredientLines, NextLink
//struct Post:Codable{
//    let from:Int
//    let to:Int
////    let hits:[Recipe]
//    let _links:Links
//}

struct Recipe {
    var label: String
    var image: String
    var ingredientLines: [String]
}

var APIResults:[Recipe] = []

//struct Links:Codable {
//    let next:HREF
//}
//
//struct HREF:Codable {
//    let href:String
//}

func callAPI(){
    let correctKey = currentKey.replacingOccurrences(of: " ", with: "%20")
    guard let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(correctKey)&app_id=8dfa162c&app_key=%2037e447ee19771369dca64f545fe008a0%09") else{
        return
    }


    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
//                print(string)
            
        }
    }

    task.resume()
}

//callAPI()

func decodeAPI(key:String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
    let correctKey = key.replacingOccurrences(of: " ", with: "%20")
    guard let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(correctKey)&app_id=8dfa162c&app_key=%2037e447ee19771369dca64f545fe008a0%09") else{
        return
    }
    
    print(url)
    
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        guard let data = data else{
//            completion(.failure(<#T##Error#>))
            print("Data Error")
            return
        }

        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else{
            print("Json error")
            return
        }

        guard let hits = json["hits"] as? [[String:Any]] else {
        print("no hits")
            return

        }
        
        hits.forEach{recipes in
            guard let recipe = recipes["recipe"] as? [String:Any] else {
                       return
                   }
            guard let label = recipe["label"] as? String else {
                    return
                }
//                print(label)
        
                guard let recipeImage = recipe["image"] as? String else{
                    return
                }
            print("\(recipeImage)\n\n")
        
                guard let ingredients = recipe["ingredientLines"] as? [String] else {
                     return
                }
        
//                ingredients.forEach{ingredient in
//                    print(ingredient)
//                }
//            print("\n")
            var newRecipe:Recipe = Recipe(label: label, image: recipeImage, ingredientLines: ingredients)

            APIResults.append(newRecipe)
            
//            print(APIResults)
            completion(.success(APIResults))
        }
//        print(APIResults)
    }
    task.resume()
    
}

decodeAPI(key: currentKey) { result in
    switch result{
    case .success(let Results):
        APIResults = Results
//        print(APIResults)
    case .failure(_):
        print("issue")
    }
        
}

//print(APIResults)

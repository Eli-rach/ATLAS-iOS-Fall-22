import UIKit

var currentKey = "Apple Blueberry"

///What I need: Label, image, ingredientLines, NextLink
struct Post:Codable{
    let from:Int
    let to:Int
//    let hits:[Recipe]
    let _links:Links
}
struct Recipe:Codable {
    let label: String
    let image: String
    let ingredientLines: String
}

struct Links:Codable {
    let next:HREF
}

struct HREF:Codable {
    let href:String
}

func callAPI(){
    let correctKey = currentKey.replacingOccurrences(of: " ", with: "%20")
    guard let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(correctKey)&app_id=8dfa162c&app_key=%2037e447ee19771369dca64f545fe008a0%09") else{
        return
    }


    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
                print(string)
            
        }
    }

    task.resume()
}

//callAPI()

func decodeAPI(key:String){
    let correctKey = key.replacingOccurrences(of: " ", with: "%20")
    guard let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(correctKey)&app_id=8dfa162c&app_key=%2037e447ee19771369dca64f545fe008a0%09") else{
        return
    }
    
    print(url)
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        guard let data = data else{
            print("Data Error")
            return
        }
        //print(String(data: data, encoding: .utf8))
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else{
            print("Json error")
            return
        }
//        print(json)
        
//        //grab from
//        print("Getting data...")
//
//        guard let from = json["from"] as? Int else {
//            return
//
//        }
////        print(from)
//
//        //grab to
//        guard let to = json["to"] as? Int else {return}
////        print(to)
//
//        //grab next href
//        guard let links = json["_links"]  as? [String:Any] else {return}
//        guard let next = links["next"]  as? [String:Any] else {return}
////        print(next)
//        guard let href = next["href"] as? String else {return}
////        print(href)
//
//        //grab recipes
        guard let hits = json["hits"] as? [[String:Any]] else {
        print("no hits")
            return

        }
        
//        let recipeOne = hits[0]
////
//        print(recipeOne)
        hits.forEach{recipes in
            guard let recipe = recipes["recipe"] as? [String:Any] else {
                       return
                   }
            guard let label = recipe["label"] as? String else {
                    return
                }
                print(label)
        
                guard let recipeImage = recipe["image"] as? String else{
                    return
                }
        
                
        
                guard let ingredients = recipe["ingredientLines"] as? [String] else {
                     return
                }
        
                ingredients.forEach{ingredient in
                    print(ingredient)
                }
            print("\n")
           
        }
        
//        guard let recipe = recipeOne["recipe"] as? [String:Any] else {
//
//            return
//        }
//
//        guard let label = recipe["label"] as? String else {
//            return
//        }
//        print(label)
//
//        guard let recipeImage = recipe["image"] as? String else{
//            return
//        }
//
//        print(recipeImage)
//
//        guard let ingredients = recipe["ingredientLines"] as? [String] else {
//             return
//        }
//
//        ingredients.forEach{ingredient in
//            print(ingredient)
//        }
//
//
////        guard let linkSingle = recipeOne["_links"] as? [String:Any] else {return}
//////        print(linkSingle)
////        guard let selfSingle = linkSingle["self"] as? [String:Any] else {return}
//////        print(selfSingle)
////        guard let hrefSingle = selfSingle["href"] as? String else {return}
//////        print(hrefSingle)
////
////        guard let url2 = URL(string: hrefSingle) else{
////            return
////        }
////
////        print(url2)
//
//
////        let task = URLSession.shared.dataTask(with: url2){
////            data2, response2, error2 in
////            print("in second session")
////            guard let data2 = data2 else{
////                print("Data Error")
////                return
////            }
////            print("Trying json #2...")
////            guard let json = try? JSONSerialization.jsonObject(with: data2, options: .allowFragments) as? [String:Any] else{
////                print("Json error")
////                return
////            }
////
////            print(json)
////
////        }
////
////        guard let recipeName = recipeOne["recipe"] as? String else {
////            print("no label")
////            return
////        }
////        print(recipeName)
//
////        guard hits["recipe"] != nil  else {return}
////        print(recipes)
////        print("In function")
        
    }
    task.resume()
}
decodeAPI(key: currentKey)


 

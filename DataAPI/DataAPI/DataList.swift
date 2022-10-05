//
//  DataList.swift
//  DataAPI
//
//  Created by Charlie Nevitt on 10/5/22.
//

import SwiftUI

struct DataList: View {
    @State var posts: Post = Post(anime: "", character: "", quote: "")
    var body: some View {
        VStack{
        Text(posts.anime)
        Text("\"" + posts.quote + "\"")
        Text("- " + posts.character)
            
        }
        .onAppear() {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
            
            }
        
    }

struct DataList_Previews: PreviewProvider {
    static var previews: some View {
        DataList()
    }
}

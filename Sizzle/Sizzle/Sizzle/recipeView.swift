//
//  recipeView.swift
//  Sizzle
//
//  Created by Charlie Nevitt on 11/2/22.
//

import SwiftUI

struct recipeView: View {
    let image:String
    let recipeName: String
    @State private var selectedTab = "one"
    var body: some View {
        VStack{
            Image(image)
            Text(recipeName)
            TabView(selection:$selectedTab){
                Text("Ingredients")
                    .onTapGesture {
                        selectedTab = "Two"
                    }
                    .tabItem{
                        Label("Ingredients", systemImage: "Star")
                    }
                
                Text("Instructions")
                    .tabItem{
                        Label("Instructions", systemImage: "Circle")
                    }
                    .tag("two")
                    .frame(width: UIScreen.main.bounds.width - 160, height: 80)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                withAnimation(.easeOut(duration: .4))
            }
        }
    }
}

struct recipeView_Previews: PreviewProvider {
    static var previews: some View {
        recipeView(image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2FShrek%2F&psig=AOvVaw1Ikf62dVMWWYieYQ5LJJ9R&ust=1667505398281000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKDA6uijkPsCFQAAAAAdAAAAABAE",
            recipeName: "Food"
        )
    }
}

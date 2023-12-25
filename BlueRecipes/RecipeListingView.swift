//
//  RecipeListingView.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 12/25/23.
//

import SwiftUI
import SwiftData

struct RecipeListingView: View {
    @Query (sort: [SortDescriptor(\Recipe.name, order: .reverse)]) var recipes: [Recipe]
    @Environment(\.modelContext) var modelContext


    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(value: recipe) {
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.headline)
                        Text(recipe.describe)
                    }
                }
            }
            .onDelete(perform: deleteRecipe)
        }
    }

    init(sort: SortDescriptor<Recipe>) {
        _recipes = Query(sort: [sort])

    }


    func deleteRecipe(_ indexSet: IndexSet) {
        for index in indexSet {
            let recipe = recipes[index]
            modelContext.delete(recipe)
        }
    }
}

#Preview {
    RecipeListingView(sort: SortDescriptor(\Recipe.name))
}

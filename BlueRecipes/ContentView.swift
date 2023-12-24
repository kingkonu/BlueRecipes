//
//  ContentView.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 11/23/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var path = [Recipe]()
    @Environment(\.modelContext) var modelContext
    @Query var recipes: [Recipe]

    var body: some View {
        NavigationStack(path: $path) {
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
            .navigationTitle("Рецепты")
            .navigationDestination(for: Recipe.self, destination: EditRecipeView.init)
            .toolbar {
                Button("Добавить рецепт", systemImage: "plus", action: addRecipe)
            }
        }
    }

    
    func addRecipe() {
        let recipe = Recipe()
        modelContext.insert(recipe)
        path = [recipe]
    }

    func deleteRecipe(_ indexSet: IndexSet) {
        for index in indexSet {
            let recipe = recipes[index]
            modelContext.delete(recipe)
        }
    }
}



#Preview {
    ContentView()
}

//
//  ContentView.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 11/23/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var recipes: [Recipe]

    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.headline)
                        Text(recipe.describe)
                    }
                }
                .onDelete(perform: deleteRecipe)
            }
            .navigationTitle("Рецепты")
            .toolbar {
                Button("Add samples", action: addSamples)
            }
        }
    }

    func addSamples() {
        let soup = Recipe(name: "Суп")

        modelContext.insert(soup)
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

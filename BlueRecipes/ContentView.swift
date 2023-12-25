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
    @State private var sortOrder = SortDescriptor(\Recipe.name)
    
    var body: some View {
        NavigationStack(path: $path) {
            RecipeListingView(sort: sortOrder)
                .navigationTitle("Рецепты")
                .navigationDestination(for: Recipe.self, destination: EditRecipeView.init)
                .toolbar {
                    Button("Добавить рецепт", systemImage: "plus", action: addRecipe)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Recipe.name))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addRecipe() {
        let recipe = Recipe()
        modelContext.insert(recipe)
        path = [recipe]
    }
}



#Preview {
    ContentView()
}

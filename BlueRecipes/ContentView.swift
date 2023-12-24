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
}


#Preview {
    ContentView()
}

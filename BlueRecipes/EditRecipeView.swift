//
//  EditRecipeView.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 12/24/23.
//

import SwiftUI
import SwiftData

struct EditRecipeView: View {
    @Bindable var recipes: Recipe
    
    var body: some View {
        Form {
            TextField("Название", text: $recipes.name)
        }
        .navigationTitle("Изменить название блюда")
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Recipe.self, configurations: config)
        let example = Recipe(name: "Paprica")
        return EditRecipeView(recipes: example)
            .modelContainer(container)
    } catch {
        fatalError("failed to create model")
    }
}

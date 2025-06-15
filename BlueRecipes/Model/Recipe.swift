//
//  Recipe.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 12/23/23.
//

import Foundation
import SwiftData

@Model
class Recipe {
    let id = UUID()
    var name: String = ""
    // These properties need to be mutable so that the initializer can
    // assign the provided values. Declaring them as constants with a
    // default value prevents re-assignment in init which results in a
    // compile-time error.
    var describe: String = ""
    var ingredients: String = ""
    var cooking: String = ""
    var isFavorite: Bool

    init(name: String = "", describe: String = "", ingredients: String = "", cooking: String = "", isFavorite: Bool = false) {
        self.name = name
        self.describe = describe
        self.ingredients = ingredients
        self.cooking = cooking
        self.isFavorite = isFavorite
    }

}

@Model
class PreCreatedRecipes {
    var recipes: [Recipe] = []

    init() {
        addRecipe()
    }

    //добавляем завтраки
    func addRecipe() {
        recipes = recipeData
    }

    //добавляем завтраки
    func addRecipeDinner() {
        recipes = recipeDataDinner
    }
    
    //добавляем завтраки
    func addRecipeEvening() {
        recipes = recipeDataEvening
    }
}


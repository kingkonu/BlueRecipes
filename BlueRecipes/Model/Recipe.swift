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
    var name: String
    let describe: String
    let ingredients: String
    let cooking: String
    var isFavorite: Bool

    init(name: String = "", describe: String = "", ingredients: String = "", cooking: String = "", isFavorite: Bool = false) {
        self.name = name
        self.describe = describe
        self.ingredients = ingredients
        self.cooking = cooking
        self.isFavorite = isFavorite
    }
}

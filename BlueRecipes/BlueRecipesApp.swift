//
//  BlueRecipesApp.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 11/23/23.
//

import SwiftData
import SwiftUI

@main
struct BlueRecipesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Recipe.self)
    }
}

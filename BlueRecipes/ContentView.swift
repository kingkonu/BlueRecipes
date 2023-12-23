//
//  ContentView.swift
//  BlueRecipes
//
//  Created by Alexey Kanaev on 11/23/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var recipes: [Recipe]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

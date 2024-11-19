//
//  NavigationSplitViewAppApp.swift
//  NavigationSplitViewApp
//
//  Created by Tiago Henriques on 19/11/2024.
//

import SwiftUI

@main
struct NavigationSplitViewApp: App {
    @State private var favouritesManager = FavouritesManager()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(favouritesManager)
        }
    }
}

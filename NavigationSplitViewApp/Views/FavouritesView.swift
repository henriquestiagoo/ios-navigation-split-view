//
//  FavouritesView.swift
//  NavigationSplitViewApp
//
//  Created by Tiago Henriques on 19/11/2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject private var favouritesManager: FavouritesManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            List {
                if favouritesManager.issues.isEmpty {
                    Text("You have no favourite issues")
                } else {
                    ForEach(favouritesManager.issues) { issue in
                        Text(issue.title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    favouritesManager.remove(id: issue.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .symbolVariant(.fill)
                            .padding(4)
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouritesView()
        .environmentObject(FavouritesManager())
}

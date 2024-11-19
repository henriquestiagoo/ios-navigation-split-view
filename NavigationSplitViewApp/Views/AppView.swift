//
//  AppView.swift
//  NavigationSplitViewApp
//
//  Created by Tiago Henriques on 19/11/2024.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject private var favouritesManager: FavouritesManager
    @State private var selectedIssue: Issue?
    @State private var showFavourites: Bool = false

    var body: some View {
        NavigationSplitView {
            SidebarView(selectedIssue: $selectedIssue)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            showFavourites.toggle()
                        } label: {
                            Image(systemName: "heart")
                                .symbolVariant(.fill)
                                .padding(4)
                        }
                    }
                }
        } detail: {
            if let selectedIssue = selectedIssue {
                IssueView(issue: selectedIssue)
            } else {
                Text("Choose any article to view its details.")
            }
        }
        .sheet(isPresented: $showFavourites) {
            FavouritesView()
        }
    }
}

struct IssueRowView: View {
    let issue: Issue

    var body: some View {
        VStack(alignment: .leading) {
            Text(issue.title)
                .font(.headline)
            Text("Issue #\(issue.number)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AppView()
        .environmentObject(FavouritesManager())
}

//
//  SidebarView.swift
//  NavigationSplitViewApp
//
//  Created by Tiago Henriques on 19/11/2024.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedIssue: Issue?

    var body: some View {
        List(
            Issue.sortedMocks,
            selection: $selectedIssue
        ) { issue in
            NavigationLink(value: issue) {
                IssueRowView(issue: issue)
            }
        }
        .navigationTitle("Issues")
    }
}

#Preview {
    NavigationSplitView {
        SidebarView(selectedIssue: .constant(nil))
    } detail: {
        Text("Some content goes here.")
    }
    .environmentObject(FavouritesManager())
}

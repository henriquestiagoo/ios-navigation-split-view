//
//  ArticlesView.swift
//  NavigationSplitViewApp
//
//  Created by Tiago Henriques on 19/11/2024.
//

import SwiftUI

struct ArticlesView: View {
    let articles: [Article]

    var body: some View {
        List {
            ForEach(articles) { article in
                Text(article.title)
            }
        }
        .navigationTitle("Articles")
    }
}

#Preview {
    NavigationStack {
        ArticlesView(articles: Article.articlesFromIssue22)
            .environmentObject(FavouritesManager())
    }
}

//
//  ContentView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI
import SwiftData

@Observable class CategoryManager {
    var categories: [UICategory] = UICategory.all
    
    var searchText: String = ""
    
    var filtered: [UICategory] {
        if searchText.isEmpty { return categories }
        
        let searchLowerCased = searchText.lowercased()
        return categories.filter { category in
            category.name.lowercased().contains(searchLowerCased) ||
            category.components.contains(where: { comp in
                comp.lowercased().contains(searchLowerCased)
            })
        }
    }
}

struct ContentView: View {
    @State private var categoryManager = CategoryManager()
    @State private var path: [CategoryType] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(categoryManager.filtered) { category in
                    CategoryRowView(category: category)
                        .onTapGesture {
                            path.append(category.type)
                        }
                }
            }
            .searchable(text: $categoryManager.searchText)
            .navigationTitle("Components")
            .navigationDestination(for: CategoryType.self) { category in
                switch category {
                case .textInput:
                    TextInputDetailView(type: category)
                default:
                    Text("Text input")
                }
            }
        }
    }
}

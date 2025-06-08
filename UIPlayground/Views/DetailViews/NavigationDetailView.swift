//
//  NavigationDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "NavigationStack", "NavigationLink", "TabView", "NavigationSplitView"
struct NavigationDetailView: View {
    
    let type: CategoryType
    
    @State private var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                navigationLink
                SectionDivider()

                tabView
                SectionDivider()
                
                navigationSplitView
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var navigationLink: some View {
        Section {
            NavigationLink("Navigate to TextInputDetailView") {
                TextInputDetailView(type: .textInput)
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.link)
        } header: {
            SectionHeader(title: "Navigation Link")
        }
    }
    
    @State private var selectedTab: Tab = .first
    
    enum Tab: Hashable {
        case first
        case second
        case third
    }
    
    private var tabView: some View {
        Section {
            TabView(selection: $selectedTab) {
                Text("First")
                    .tabItem {
                        Image(systemName: "house")
                        Text("First")
                    }
                    .tag(Tab.first)

                Text("Second")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Second")
                    }
                    .tag(Tab.second)

                Text("Third")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Third")
                    }
                    .tag(Tab.third)
            }
        } header: {
            SectionHeader(title: "Tab View")
        }
    }
    
    private var navigationSplitView: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            Text("Select an item from the sidebar")
        }
    }
}

#Preview {
    NavigationDetailView(type: .navigation)
}

struct SidebarView: View {
    let items = ["Home", "Settings", "Profile", "About"]
    
    var body: some View {
        List(items, id: \.self) { item in
            NavigationLink(item, value: item)
        }
        .navigationTitle("Menu")
    }
}

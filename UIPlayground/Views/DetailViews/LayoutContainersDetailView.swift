//
//  LayoutContainersDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "VStack", "HStack", "ZStack", "LazyVStack", "LazyHStack", "LazyVGrid", "LazyHGrid", "Grid"
struct LayoutContainersDetailView: View {
    
    let type: CategoryType
    
    @State private var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                vStack
                SectionDivider()

                hStack
                SectionDivider()

                zStack
                SectionDivider()

                grid
                SectionDivider()

                // Lazy
                    
                lazyVStack
                SectionDivider()

                lazyHStack
                SectionDivider()

                lazyVGrid
                SectionDivider()

                lazyHGrid
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var vStack: some View {
        Section {
            VStack(alignment: .center) {
                ForEach(1...3, id: \.self) { id in
                    Button("Button \(id)", action: {}).buttonStyle(.borderedProminent)
                }
            }
        } header: {
            SectionHeader(title: "VStack")
        }
    }
    
    private var hStack: some View {
        Section {
            HStack(alignment: .center) {
                ForEach(1...3, id: \.self) { id in
                    Button("Button \(id)", action: {}).buttonStyle(.borderedProminent)
                }
            }
        } header: {
            SectionHeader(title: "HStack")
        }
    }
    
    private var zStack: some View {
        Section {
            ZStack(alignment: .center) {
                Circle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)

                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(.yellow)
                    .frame(width: 30, height: 30)
            }
        } header: {
            SectionHeader(title: "ZStack")
        }
    }

    
    private var grid: some View {
        Section {
            Grid(alignment: .leading, horizontalSpacing: 20, verticalSpacing: 16) {
                ForEach(1...3, id: \.self) { id in
                    GridRow {
                        ForEach(1...3, id: \.self) { id in
                            Text("Item \(id)")
                        }
                    }
                }
            }
        } header: {
            SectionHeader(title: "Grid")
        }
    }
        
    // Lazy
    
    private var lazyVStack: some View {
        Section {
            ScrollView {
                LazyVStack(alignment: .center) {
                    ForEach(1...20, id: \.self) { id in
                        Button("Button \(id)", action: {}).buttonStyle(.borderedProminent)
                    }
                }
            }.frame(height: 100)
        } header: {
            SectionHeader(title: "LazyVStack")
        }
    }
    
    private var lazyHStack: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center) {
                    ForEach(1...20, id: \.self) { id in
                        Button("Button \(id)", action: {}).buttonStyle(.borderedProminent)
                    }
                }
            }
        } header: {
            SectionHeader(title: "LazyHStack")
        }
    }
    
    let colums: [GridItem] = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    let photos = Array(1...50)
    
    private var lazyVGrid: some View {
        Section {
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(photos, id: \.self) { photo in
                        
                        AsyncImage(url: URL(string: "https://picsum.photos/200/200?random=\(photo)")) { image in
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)

                        } placeholder: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray.opacity(0.3))
                                .aspectRatio(1, contentMode: .fit)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }.frame(height: 300)
        } header: {
            SectionHeader(title: "LazyVGrid")
        }
    }
    
    private var lazyHGrid: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: colums) {
                    ForEach(photos, id: \.self) { photo in
                        
                        AsyncImage(url: URL(string: "https://picsum.photos/200/200?random=\(photo)")) { image in
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)

                        } placeholder: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray.opacity(0.3))
                                .aspectRatio(1, contentMode: .fit)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }.frame(height: 300)
        } header: {
            SectionHeader(title: "LazyHGrid")
        }
    }
}


#Preview {
    LayoutContainersDetailView(type: .layoutContainers)
}


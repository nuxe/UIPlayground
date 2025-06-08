//
//  MediaGraphicsDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Image", "AsyncImage", "VideoPlayer", "Map"
struct MediaGraphicsDetailView: View {
    let type: CategoryType
    
    @State private var isOn: Bool = false
    @State private var sliderVal: Float = 0

    enum PickerColor: Hashable,CaseIterable {
        case red
        case yellow
        case blue
    }
    @State private var selection: PickerColor = .red

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                image
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var image: some View {
        Section {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(.green)
                .frame(width: 60, height: 60)


            let url = URL(string: "https://picsum.photos/300")!
            AsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundStyle(.green)
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .background(
                Circle()
                    .stroke(.gray, lineWidth: 2)
            )
            
        } header: {
            SectionHeader(title: "Images")
        }
    }

}


#Preview {
    MediaGraphicsDetailView(type: .mediaGraphics)
}


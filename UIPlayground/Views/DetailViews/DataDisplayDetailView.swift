//
//  DataDisplayDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Text", "TextField", "Label", "SecureField", "TextEditor"
struct DataDisplayDetailView: View {
    
    let type: CategoryType
    
    @State var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                SectionDivider()
                text
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var text: some View {
        Text("test")
    }
}


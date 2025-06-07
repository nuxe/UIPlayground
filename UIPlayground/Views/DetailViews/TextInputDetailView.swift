//
//  TextInputDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

struct TextInputDetailView: View {
    
    let type: CategoryType

    @State var textField: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                ////                "Text", "TextField", "Label"
                Section {
                    Text("This is a text component")
                } header: {
                    Text("Text")
                        .fontWeight(.bold)
                }

                Section {
                    TextField("This is a text field", text: $textField, prompt: Text("Prompt"))
                } header: {
                    Text("TextField")
                        .fontWeight(.bold)
                }

                
                Section {
                    Label("This is a label", systemImage: "textformat.abc.dottedunderline")
                } header: {
                    Text("Label")
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
}

#Preview {
    TextInputDetailView(type: .textInput)
}


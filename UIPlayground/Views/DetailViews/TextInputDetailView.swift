//
//  TextInputDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Text", "TextField", "Label", "SecureField", "TextEditor"
struct TextInputDetailView: View {
    
    let type: CategoryType

    @State var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                label
                SectionDivider()
                text
                SectionDivider()
                textField
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var text: some View {
        Section {
            Text("Regular text")

            Text("Bold Italic Title")
                .padding()
                .foregroundStyle(.green)
                .background(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .bold()
                .italic()

            Text("This is a very very long text that goes into multiple lines and keeps growing as much as it wants to no extent. Oh my god, it keeps going...")
                .font(.title3)
                .multilineTextAlignment(.leading)
            
            Text(Date.now, style: .date)
        } header: {
            SectionHeader(title: "Text")
        }
    }
    
    private var textField: some View {
        Section {
            TextField("Textfield with background", text: $field)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.3), lineWidth: 1)
                )
            
            TextField("TextField with border, padding", text: $field)
                .focused($activeField, equals: .field1)
                .padding()
                .border(.gray, width: 1)

            TextField("TextField with overlay", text: $field)
                .focused($activeField, equals: .field2)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1)
                }
            
            TextField("TextField with custom foreground & background colors", text: $field)
                .padding()
                .focused($activeField, equals: .field3)
                .foregroundStyle(.blue)
                .background(.green)
                .border(.black, width: 2)
        } header: {
            SectionHeader(title: "TextField")
        }
        .onSubmit {
            switch activeField {
            case .field1:
                activeField = .field2
            case .field2:
                activeField = .field3
            default:
                break
            }
        }
    }
    
    private var label: some View {
        Section {
            Label("This is a label with 2 different foreground styles", systemImage: "textformat.abc.dottedunderline")
                .foregroundStyle(.cyan, .black)

            Label("This is a label with a background", systemImage: "textformat.abc.dottedunderline")
                .padding()
                .foregroundStyle(.white)
                .background(.cyan)
        } header: {
            SectionHeader(title: "Label")
        }
    }
    
    enum Fields: Hashable {
        case field1, field2, field3
    }
    @FocusState private var activeField: Fields?
}

#Preview {
    TextInputDetailView(type: .textInput)
}


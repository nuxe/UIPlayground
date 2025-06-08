//
//  ModifiersDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Background", "Foreground", "Frame", "Padding", "Border", "Shadow", "Blur", "Rotation"
struct ModifiersDetailView: View {
    
    let type: CategoryType
    
    @State private var field: String = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                background
                SectionDivider()

                foreground
                SectionDivider()

                frame
                SectionDivider()

                padding
                SectionDivider()

                border
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var background: some View {
        Section {
            Label("This is a label with a background color", systemImage: "person.circle")
                .background(.gray)
            
            Label("This is a label with a background shape", systemImage: "person.circle")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(lineWidth: 1)
                )

        } header: {
            SectionHeader(title: "Background")
        }
    }

    private var foreground: some View {
        Section {
            Label("This is a label with a foreground color", systemImage: "person.circle.fill")
                .foregroundStyle(.cyan, .green)

            Button("Button with a foreground color", action: {})
                .foregroundStyle(.cyan)
        } header: {
            SectionHeader(title: "Foreground")
        }
    }

    private var frame: some View {
        Section {
            Label("This is a label with leading alignment", systemImage: "textformat.abc.dottedunderline")
                .frame(maxWidth: .infinity, alignment: .leading)

            Label("This is a label with trailing alignment", systemImage: "textformat.abc.dottedunderline")
                .frame(maxWidth: .infinity, alignment: .trailing)
        } header: {
            SectionHeader(title: "Frame")
        }
    }

    private var padding: some View {
        Section {
            Label("This is a label with custom padding", systemImage: "textformat.abc.dottedunderline")
                .padding()
                .background(Color.cyan)

            Button("Full Width Button") {
                // Action
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundStyle(.white)

        } header: {
            SectionHeader(title: "Padding")
        }
    }

    private var border: some View {
        Section {
            TextField("This is a textfield with a border", text: $field)
                .font(.title2)
                .padding()
                .border(FillShapeStyle(), width: 2)

            Label("This is a label with a border", systemImage: "person.circle")
                .frame(maxWidth: .infinity)
                .padding()
                .border(.gray)
                .background(.cyan)
                .foregroundStyle(.white)
        } header: {
            SectionHeader(title: "Border")
        }
    }
}

#Preview {
    ModifiersDetailView(type: .modifiersStyling)
}

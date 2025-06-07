//
//  TextInputDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Button", "Toggle", "Slider", "Stepper", "Picker", "DatePicker", "ColorPicker"

struct InteractiveControlsDetailView: View {
    let type: CategoryType

    @State var isOn: Bool = false
    @State var sliderVal: Float = 0
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                
                Section {
                    Button("Plain") {
                        
                    }
                    .buttonStyle(.plain)

                    Button("Borderless") {
                        
                    }
                    .buttonStyle(.borderless)

                    Button("Automatic") {
                        
                    }
                    .buttonStyle(.automatic)

                    Button("Bordered") {
                        
                    }
                    .buttonStyle(.bordered)

                    Button("Bordered Prominent") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                } header: {
                    Text("Button")
                        .fontWeight(.bold)
                }

                Divider()

                Section {
                    Toggle("Switch", isOn: $isOn)
                        .toggleStyle(.switch)

                    Toggle("Button", isOn: $isOn)
                        .toggleStyle(.button)

                } header: {
                    Text("Toggle")
                        .fontWeight(.bold)
                }

                Divider()

                Section {
                    Slider(value: $sliderVal) {
                        Text("Current Val: \(sliderVal)")
                    } onEditingChanged: { changed in
                        print(changed)
                    }
                } header: {
                    Text("Slider: \(sliderVal)")
                        .fontWeight(.bold)
                }
                
                Divider()

                Section {
                    
                } header: {
                    Text("Picker")
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
}

#Preview {
    InteractiveControlsDetailView(type: .textInput)
}


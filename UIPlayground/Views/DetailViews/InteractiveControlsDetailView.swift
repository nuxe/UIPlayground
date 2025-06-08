//
//  InteractiveControlsDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Button", "Toggle", "Slider", "Stepper", "Picker", "DatePicker", "ColorPicker"

struct InteractiveControlsDetailView: View {
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
                button
                SectionDivider()
                toggle
                SectionDivider()
                slider
                SectionDivider()
                picker
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    private var button: some View {
        Section {
            Button("bordered", action: {}).buttonStyle(.bordered)

            Button("borderless", action: {}).buttonStyle(.borderless)

            Button("borderedProminent", action: {}).buttonStyle(.borderedProminent)

            Button("Pill Button") { }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

            Button {
                
            } label: {
                Image(systemName: "heart.fill")
            }
            .buttonStyle(.borderless)
            .imageScale(.large)
            
            Button("plain", action: {}).buttonStyle(.plain)
            
            Button {
            } label: {
                Label("System Image Button", systemImage: "arrow.down.circle")
            }

            ScrollView([.horizontal]) {
                HStack {
                    ForEach(ControlSize.allCases, id: \.self) { size in
                        Button("Size: \(size)", action: {})
                            .buttonStyle(.borderedProminent)
                            .controlSize(size)
                    }
                }
            }

            Button("Tint", action: {})
                .buttonStyle(.borderedProminent)
                .tint(Color.green)

            Button("Custom", action: {})
                .padding()
                .foregroundStyle(.white)
                .background(.green.gradient)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 4)

            Button("destructive", role: .destructive, action: {})

            Button("cancel", role: .cancel, action: {})

            
        } header: {
            SectionHeader(title: "Button")
        }
    }
    
    private var toggle: some View {
        Section {
            Toggle("Switch", isOn: $isOn)
                .toggleStyle(.switch)

            Toggle("Button", isOn: $isOn)
                .toggleStyle(.button)

        } header: {
            SectionHeader(title: "Toggle")
        }
    }
    
    private var slider: some View {
        Section {
            Slider(value: $sliderVal) {
                Text("Current Val: \(sliderVal)")
            } onEditingChanged: { changed in
                print(changed)
            }
        } header: {
            SectionHeader(title: "Slider")
            Text("\(sliderVal)")
        }
    }
    
    private var picker: some View {
        Section {
            Picker("Flavor", selection: $selection) {
                Text("Red").tag(PickerColor.red)
                Text("Yellow").tag(PickerColor.yellow)
                Button("Blue", action: {}).tag(PickerColor.blue)
                    .buttonStyle(.borderedProminent)
            }
        } header: {
            SectionHeader(title: "Picker")
        }
    }
}

#Preview {
    InteractiveControlsDetailView(type: .textInput)
}

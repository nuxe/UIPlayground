//
//  StateManagementDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "@State", "@Binding", "@Environment", "@StateObject", "@ObservedObject", "@EnvironmentObject"

struct StateManagementDetailView: View {
    
    let type: CategoryType
    
    @State private var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                stateView
                SectionDivider()

                bindingView
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
        
    @State private var count: Int = 0
    
    private var stateView: some View {
        Section {
            Button("Count: \(count)") {
                count += 1
            }
        } header: {
            SectionHeader(title: "@State: Maintain state for current view")
        }
    }
    
    private var bindingView: some View {
        Section {
            Button("Count: \(count)") {
                count += 1
            }
        } header: {
            SectionHeader(title: "@Binding: Bi-directional binding to pass down to child views")
        }
    }
    
    @Environment(\.colorScheme) var scheme
    
    private var environment: some View {
        Section {
            Label("Scheme: \(scheme)", systemImage: "person.circle.fill")
            Button("Switch scheme: \(count)") {
                
            }
        } header: {
            SectionHeader(title: "@Environment: Access dependencies from the environment")
        }
    }
    
    private var stateObject: some View {
        Section {
            Label("Scheme: \(scheme)", systemImage: "person.circle.fill")
            Button("Switch scheme: \(count)") {
                
            }
        } header: {
            SectionHeader(title: "@StateObject: View creates and owns the observable object")
        }
    }

    private var observedObject: some View {
        Section {
            Label("Scheme: \(scheme)", systemImage: "person.circle.fill")
            Button("Switch scheme: \(count)") {
                
            }
        } header: {
            SectionHeader(title: "@ObservedObject: ObservableObject passed in from parent")
        }
    }
    
    
    private var environmentObject: some View {
        Section {
            Label("Scheme: \(scheme)", systemImage: "person.circle.fill")
            Button("Switch scheme: \(count)") {
                
            }
        } header: {
            SectionHeader(title: "@EnvironmentObject: ObservableObject injected into the DI tree. Can be accessed by deeply nested views")
        }
    }

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // Navigation & presentation
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode  // iOS 13-14
    @Environment(\.isPresented) var isPresented

    // Layout
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    // Accessibility
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    // Localization
    @Environment(\.locale) var locale
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone

    // App lifecycle
    @Environment(\.scenePhase) var scenePhase
    
    private var environmentBuiltIn: some View {
        Section {
            Label("Scheme: \(scheme)", systemImage: "person.circle.fill")
            Button("Switch scheme: \(count)") {
                
            }
        } header: {
            SectionHeader(title: "@Environment: built-in SwiftUI environment values and system settings")
        }
    }
    
    private var text: some View {
        Text("test")
    }
}


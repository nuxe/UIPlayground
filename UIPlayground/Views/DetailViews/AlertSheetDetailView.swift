//
//  AlertSheetDetailView.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

// "Alert", "ActionSheet", "Sheet", "FullScreenCover", "Popover", "ConfirmationDialog"
struct AlertSheetDetailView: View {
    
    let type: CategoryType
    
    @State private var field: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 50) {
                alert
                SectionDivider()
                
                confirmationSheet
                SectionDivider()

                modalSheet
                SectionDivider()
            }
        }
        .padding()
        .navigationTitle(type.rawValue)
    }
    
    @State private var displayAlert: Bool = false
    
    private var alert: some View {
        Section {
            Button("Show alert") {
                displayAlert = true
            }.alert("Alert", isPresented: $displayAlert) {
                Button("Dismiss") {
                    displayAlert = false
                }
            }
        } header: {
            SectionHeader(title: "Navigation Link")
        }
    }
    
    @State private var displayConfirmation: Bool = false

    private var confirmationSheet: some View {
        Section {
            Button("Show confirmation") {
                displayConfirmation = true
            }
            .confirmationDialog("Confirmation", isPresented: $displayConfirmation) {
                Button("Dismiss") {
                    displayConfirmation = false
                }
            }
        } header: {
            SectionHeader(title: "Action Sheet")
        }
    }
    
    struct SheetContent: Identifiable, Hashable {
        let id: UUID = .init()
        let name: String
    }
    @State private var sheetItem: SheetContent?

    private var modalSheet: some View {
        Section {
            Button("Show sheet") {
                sheetItem = .init(name: "Kush")
            }
            .sheet(item: $sheetItem) { item in
                Text(item.name)
            }
        } header: {
            SectionHeader(title: "Modal Sheet")
        }
    }
}

#Preview {
    AlertSheetDetailView(type: .alertsSheets)
}


//
//  UICategory.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import Foundation

enum CategoryType: String, CaseIterable, Hashable {
    case textInput = "Text & Input ✅"
    case interactiveControls = "Interactive Controls ✅"
    case mediaGraphics = "Media & Graphics ✅"
    case modifiersStyling = "Modifiers & Styling ✅"
    case layoutContainers = "Layout Containers ✅"
    case navigation = "Navigation ✅"
    case stateManagement = "State Management ✅"
    case alertsSheets = "Alerts & Sheets ✅"
    case dataDisplay = "Data Display"
    case shapesDrawing = "Shapes & Drawing"
    case animations = "Animations"
    case gestures = "Gestures"
}

struct UICategory: Identifiable {
    let id = UUID()
    let type: CategoryType
    let icon: String
    let components: [String]
    
    var name: String {
        type.rawValue
    }
    
    static let all: [UICategory] = [
        UICategory(
            type: .textInput,
            icon: "textformat",
            components: ["Text", "TextField", "Label", "SecureField", "TextEditor"]
        ),
        UICategory(
            type: .interactiveControls,
            icon: "hand.tap",
            components: ["Button", "Toggle", "Slider", "Stepper", "Picker", "DatePicker", "ColorPicker"]
        ),
        UICategory(
            type: .mediaGraphics,
            icon: "photo",
            components: ["Image", "AsyncImage", "VideoPlayer", "Map"]
        ),
        UICategory(
            type: .modifiersStyling,
            icon: "paintbrush",
            components: ["Background", "Foreground", "Frame", "Padding", "Border", "Shadow", "Blur", "Rotation"]
        ),
        UICategory(
            type: .layoutContainers,
            icon: "rectangle.3.group",
            components: ["VStack", "HStack", "ZStack", "LazyVStack", "LazyHStack", "LazyVGrid", "LazyHGrid", "Grid"]
        ),
        UICategory(
            type: .navigation,
            icon: "arrow.turn.up.right",
            components: ["NavigationStack", "NavigationLink", "TabView", "NavigationSplitView"]
        ),
        UICategory(
            type: .stateManagement,
            icon: "arrow.clockwise",
            components: ["@State", "@Binding", "@ObservedObject", "@StateObject", "@EnvironmentObject", "@Environment"]
        ),
        UICategory(
            type: .alertsSheets,
            icon: "exclamationmark.triangle",
            components: ["Alert", "ActionSheet", "Sheet", "FullScreenCover", "Popover", "ConfirmationDialog"]
        ),
        UICategory(
            type: .dataDisplay,
            icon: "list.bullet",
            components: ["List", "ForEach", "ScrollView", "Table", "DisclosureGroup"]
        ),
        UICategory(
            type: .shapesDrawing,
            icon: "circle",
            components: ["Rectangle", "Circle", "RoundedRectangle", "Ellipse", "Capsule", "Path", "Canvas"]
        ),
        UICategory(
            type: .animations,
            icon: "wand.and.rays",
            components: ["Animation", "Transition", "MatchedGeometry", "Spring", "Easing"]
        ),
        UICategory(
            type: .gestures,
            icon: "hand.point.up.left",
            components: ["TapGesture", "LongPressGesture", "DragGesture", "MagnificationGesture", "RotationGesture"]
        )
    ]
    
    static func fake() -> UICategory {
        all.first!
    }
}

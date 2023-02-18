//
//  IconStyle.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

enum IconStyle {
    case macOS
    case iOS
}

private struct IconStyleKey: EnvironmentKey {
    static let defaultValue: IconStyle = .macOS
}

extension EnvironmentValues {
    var iconStyle: IconStyle {
        get { self[IconStyleKey.self] }
        set { self[IconStyleKey.self] = newValue }
    }
}

extension View {
    func iconStyle(_ renderStyle: IconStyle) -> some View {
        modifier(IconStyleWrapper(style: renderStyle))
    }
}

internal struct IconStyleWrapper: ViewModifier {
    @Environment(\.iconSize) private var iconSize
    let style: IconStyle

    func body(content: Content) -> some View {
        content
            .modifier(IconStyleRenderer(style: style, size: iconSize))
    }
}

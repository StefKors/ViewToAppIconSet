//
//  IconStyle.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

/// Used to specify icon rendering style.
public enum IconStyle {
    case macOS
    case iOS
}

/// Read the current IconStyle
/// ```swift
/// @Environment(\.iconStyle) private var iconStyle
/// ```
public struct IconStyleKey: EnvironmentKey {
    public static let defaultValue: IconStyle = .macOS
}

public extension EnvironmentValues {
    var iconStyle: IconStyle {
        get { self[IconStyleKey.self] }
        set { self[IconStyleKey.self] = newValue }
    }
}

public extension View {
    /// ViewModifier used to control the style of appicon
    /// - Parameter renderStyle
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

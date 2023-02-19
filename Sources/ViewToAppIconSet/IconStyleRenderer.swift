//
//  IconStyleRenderer.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

public extension View {
    /// ViewModifier used to control the style of appicon view
    /// - Parameters:
    ///   - style:
    ///   - size:
    /// - Returns:
    func icon(style: IconStyle, size: IconSize) -> some View {
        modifier(IconStyleRenderer(style: style, size: size))
    }
}

internal struct IconStyleRenderer: ViewModifier {
    let size: IconSize
    let style: IconStyle
    var radius: CGFloat
    var shadow: CGFloat

    internal init(style: IconStyle, size: IconSize) {
        self.style = style
        self.size = size

        switch size {
        case .large:
            self.radius = 30
            self.shadow = 10
        case .medium:
            self.radius = 30
            self.shadow = 5
        case .small:
            self.radius = 10
            self.shadow = 2
        }
    }

    func body(content: Content) -> some View {
        switch style {
        case .macOS:
            content
                // .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
                // .shadow(radius: shadow, y: 1)
                // .padding()
        case .iOS:
            Color.red
        }
    }
}

struct IconStyleRenderer_Previews: PreviewProvider {
    static var previews: some View {
        Color.pink
            .modifier(IconStyleRenderer(style: .macOS, size: .medium))
    }
}

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

public extension View {
    /// ViewModifier used to control the style of appicon
    /// - Parameter renderStyle
    func iconStyle(_ renderStyle: IconStyle) -> some View {
        modifier(IconStyleRenderer(renderStyle))
    }
}

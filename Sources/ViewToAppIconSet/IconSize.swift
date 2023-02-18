//
//  IconSize.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

/// Used to specify different icon sizes.
public enum IconSize {
    case large
    case medium
    case small
}

/// Read the current IconSize
/// ```swift
/// @Environment(\.iconSize) private var iconSize
/// ```
public struct IconSizeKey: EnvironmentKey {
    static public let defaultValue: IconSize = .medium
}

public extension EnvironmentValues {
    var iconSize: IconSize {
        get { self[IconSizeKey.self] }
        set { self[IconSizeKey.self] = newValue }
    }
}

public extension View {
    func iconSize(_ renderSize: IconSize) -> some View {
        environment(\.iconSize, renderSize)
    }
}

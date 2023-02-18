//
//  IconSize.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

enum IconSize {
    case large
    case medium
    case small
}

private struct IconSizeKey: EnvironmentKey {
    static let defaultValue: IconSize = .medium
}

extension EnvironmentValues {
    var iconSize: IconSize {
        get { self[IconSizeKey.self] }
        set { self[IconSizeKey.self] = newValue }
    }
}

extension View {
    func iconSize(_ renderSize: IconSize) -> some View {
        environment(\.iconSize, renderSize)
    }
}

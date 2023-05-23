//
//  IconRelativeMetric.swift
//  ViewToAppIconSetPlayground
//
//  Created by Stef Kors on 23/05/2023.
//

import SwiftUI

/// Use `@IconRelativeMetric var padding = 10` to get a relatively sized value that scales to every icon size.
@propertyWrapper public struct IconRelativeMetric: DynamicProperty {
    public init(wrappedValue: CGFloat) {
        self.unscaledValue = wrappedValue
    }

    @Environment(\.parentSize) private var parentSize

    public var wrappedValue: CGFloat {
        scale(unscaledValue)
    }

    private var unscaledValue: CGFloat = 0

    private func scale(_ value: CGFloat) -> CGFloat {
        return (parentSize/100)*value
    }
}

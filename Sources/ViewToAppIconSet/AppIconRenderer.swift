//
//  AppIconRenderer.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

/// A view that renders any view as an AppIcon.
///
/// The following example shows a simple view rendered as a macOS style AppIcon:
///
/// ```swift
/// AppIconRenderer {
///     AppIcon
/// }
/// .iconStyle(.macOS)
/// ```
///
/// It's also possible to specify different views for different rendering sizes:
///
/// ```swift
/// AppIconRenderer(large: {
///     AppIcon
/// }, medium: {
///     AppIcon
/// }, small: {
///     AppIcon
/// })
/// .iconStyle(.iOS)
/// ```
///
/// > Note: For the best results across the different sizes use the ``aspectRatio(_:contentMode:)-2o0lj`` to layout your view.

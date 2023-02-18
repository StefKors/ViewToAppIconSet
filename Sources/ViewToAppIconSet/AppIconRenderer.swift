//
//  AppIconRenderer.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

public struct AppIconRenderer<Content: View>: View {
    internal init(large: @escaping () -> Content, medium: @escaping () -> Content, small: @escaping () -> Content) {
        self.large = large
        self.medium = medium
        self.small = small
    }

    internal init(content: @escaping () -> Content) {
        self.large = content
        self.medium = content
        self.small = content
    }

    @Environment(\.iconSize) private var iconSize

    @ViewBuilder var large: () -> Content
    @ViewBuilder var medium: () -> Content
    @ViewBuilder var small: () -> Content

    public var body: some View {
        Group {
            switch iconSize {
            case .large: large().frame(
                minWidth: 256,
                idealWidth: 256,
                maxWidth: 1024,
                minHeight: 256,
                idealHeight: 256,
                maxHeight: 1024,
                alignment: .center
            )
            case .medium: medium().frame(
                minWidth: 62,
                idealWidth: 62,
                maxWidth: 256,
                minHeight: 62,
                idealHeight: 62,
                maxHeight: 256,
                alignment: .center
            )
            case .small: small().frame(
                minWidth: 16,
                idealWidth: 16,
                maxWidth: 62,
                minHeight: 16,
                idealHeight: 16,
                maxHeight: 62,
                alignment: .center
            )
            }
        }.aspectRatio(CGSize(width: 10, height: 10), contentMode: .fit)
    }
}

struct AppIconRenderer_Previews: PreviewProvider {
    static let AppIcon: some View = ZStack {
        Color.black
        Color.accentColor.opacity(0.8)
        HStack(spacing: 0) {
            Capsule(style: .continuous)
                .fill(Color.accentColor)
                .aspectRatio(CGSize(width: 2, height: 10), contentMode: .fit)
                .rotationEffect(.degrees(30))
            Capsule(style: .continuous)
                .fill(Color.accentColor)
                .aspectRatio(CGSize(width: 2, height: 10), contentMode: .fit)
                .rotationEffect(.degrees(30))
        }.shadow(radius: 5)
    }
    static var previews: some View {
        AppIconRenderer {
            AppIcon
        }
        .iconStyle(.macOS)
        .iconSize(.large)
        .previewDisplayName("Single")

        VStack {
            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.macOS)

            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.iOS)
        }
        .environment(\.iconSize, .large)
        .iconSize(.large)
        .previewDisplayName("Large")

        VStack {
            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.macOS)

            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.iOS)
        }
        .iconSize(.medium)
        .previewDisplayName("Medium")

        VStack {
            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.macOS)

            AppIconRenderer(large: {
                AppIcon
            }, medium: {
                AppIcon
            }, small: {
                AppIcon
            })
            .iconStyle(.iOS)
        }
        .iconSize(.small)
        .previewDisplayName("Small")
    }
}

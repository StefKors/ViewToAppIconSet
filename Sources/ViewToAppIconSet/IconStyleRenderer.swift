//
//  IconStyleRenderer.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

extension EnvironmentValues {
    public var parentSize: CGFloat {
        get {
            return self[ParentSizeEnvironmentKey.self]
        }
        set {
            self[ParentSizeEnvironmentKey.self] = newValue
        }
    }
}

struct ParentSizeEnvironmentKey: EnvironmentKey {
    static let defaultValue: CGFloat = 512
}

private struct SingleAxisGeometryReader<Content: View>: View {
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGFloat { 10 }
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }

    @State private var size: CGFloat = SizeKey.defaultValue
    var axis: Axis = .horizontal
    var alignment: Alignment = .center
    let content: (CGFloat)->Content

    var body: some View {
        content(size)
            .frame(maxWidth:  axis == .horizontal ? .infinity : nil,
                   maxHeight: axis == .vertical   ? .infinity : nil,
                   alignment: alignment)
            .background(GeometryReader {
                proxy in
                Color.clear.preference(key: SizeKey.self, value: axis == .horizontal ? proxy.size.width : proxy.size.height)
            }).onPreferenceChange(SizeKey.self) { size = $0 }
    }
}

internal struct IconStyleRenderer: ViewModifier {
    private let style: IconStyle
    private let radius: CGFloat = 20
    private let shadow: CGFloat = 10

    internal init(_ style: IconStyle) {
        self.style = style
    }

    func body(content: Content) -> some View {
        switch style {
        case .macOS:
            SingleAxisGeometryReader { width in
                content
                    .environment(\.parentSize, width)
                    .clipShape(RoundedRectangle(cornerRadius: (width*0.2), style: .circular))
                    .shadow(radius: (width*0.02), y: (width*0.002))
                    .padding((width*0.08))
                    .frame(width: width, height: width, alignment: .center)
            }
            .aspectRatio(CGSize(width: 10, height: 10), contentMode: .fit)
        case .iOS:
            SingleAxisGeometryReader { width in
                content
                    .environment(\.parentSize, width)
                    .frame(width: width, height: width, alignment: .center)
            }
            .aspectRatio(CGSize(width: 10, height: 10), contentMode: .fit)
        }
    }
}

struct IconStyleRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppIconView()
            .modifier(IconStyleRenderer(.macOS))
            .frame(width: 16, height: 16, alignment: .center)
            // 
            // VStack {
            //     Image(systemName: "circle.fill")
            //         .resizable()
            //         .scaledToFit()
            //         .padding(102.4)
            //         .foregroundColor(.white)
            // }
            // .background(Color.indigo)
            // .modifier(IconStyleRenderer(.macOS))
            // .frame(width: 512, height: 512, alignment: .center)
            // 
            // VStack {
            //     Image(systemName: "circle.fill")
            //         .resizable()
            //         .scaledToFit()
            //         .padding(20)
            //         .foregroundColor(.white)
            // }
            // .background(Color.indigo)
            // .modifier(IconStyleRenderer(.macOS))
            // .frame(width: 100, height: 100, alignment: .center)
        }
        // .frame(height: 500)
        .scenePadding()
    }
}

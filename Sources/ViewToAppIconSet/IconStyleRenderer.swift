//
//  IconStyleRenderer.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

internal struct IconStyleRenderer: ViewModifier {
    private let style: IconStyle
    private let radius: CGFloat = 60
    private let shadow: CGFloat = 10

    internal init(_ style: IconStyle) {
        self.style = style
    }

    func body(content: Content) -> some View {
        switch style {
        case .macOS:
            content
                .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
                .aspectRatio(CGSize(width: 10, height: 10), contentMode: .fit)
                .shadow(radius: shadow, y: 1)
                .padding()
                .frame(width: 512, height: 512)
        case .iOS:
            content
                .aspectRatio(CGSize(width: 10, height: 10), contentMode: .fit)
                .frame(width: 512, height: 512)
        }
    }
}

struct IconStyleRenderer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            // Color.green.frame(width: 512, height: 512, alignment: .center)

            Color.pink
                .modifier(IconStyleRenderer(.macOS))
        }
    }
}

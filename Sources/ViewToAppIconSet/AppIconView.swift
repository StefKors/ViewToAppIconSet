//
//  SwiftUIView.swift
//
//
//  Created by Stef Kors on 20/02/2023.
//

import SwiftUI

// https://twitter.com/SeanKly/status/1618591718831710212
// https://3dicons.co/

struct AppIconView: View {
    @Environment(\.parentSize) var parentSize
    @IconRelativeMetric var padding = 10

    let color = Color(red: 0.278293, green: 0.462935, blue: 0.184242)
    static let dark = Color(red: 0.262613, green: 0.447244, blue: 0.172477)
    static let light = Color(red: 0.458661, green: 0.600203, blue: 0.356815)
    let gradient = LinearGradient(
        colors: [
            AppIconView.dark,
            AppIconView.light
        ],
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    var body: some View {
        ZStack {
            gradient

            Circle()
                .fill(gradient)
                .padding(padding)
                .shadow(radius: padding)
        }
    }
}


struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AppIconView()
                .iconStyle(.macOS)
                .frame(width: 200, height: 200, alignment: .center)
        }
        .scenePadding()
    }
}

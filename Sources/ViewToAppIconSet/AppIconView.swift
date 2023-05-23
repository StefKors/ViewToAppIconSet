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

    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
            .resizable()
            .scaledToFit()
            .padding(padding)
            .foregroundColor(.white)
            .background(Color.indigo)
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AppIconView()
                .frame(width: 200, height: 200, alignment: .center)
                .iconStyle(.macOS)
                .background(.blue)

            // AppIconView()
            //     .frame(width: 100, height: 100, alignment: .center)
            //     .iconStyle(.macOS)
            //     .background(.blue)

            // AppIconView()
            //     // .frame(width: 100, height: 100, alignment: .center)
            //     .iconStyle(.iOS)

        }
        .scenePadding()
    }
}

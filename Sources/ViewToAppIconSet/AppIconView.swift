//
//  SwiftUIView.swift
//  
//
//  Created by Stef Kors on 20/02/2023.
//

import SwiftUI

// https://twitter.com/SeanKly/status/1618591718831710212
// https://3dicons.co/
private struct AppIconView: View {
    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
            .resizable()
            .scaledToFit()
            .padding(100)
            .foregroundColor(.white)
            .background(Color.indigo)
    }
}

private struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .iconStyle(.macOS)
            .scenePadding()
    }
}

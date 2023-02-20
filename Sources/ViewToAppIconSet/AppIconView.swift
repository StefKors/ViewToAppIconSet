//
//  SwiftUIView.swift
//  
//
//  Created by Stef Kors on 20/02/2023.
//

import SwiftUI

struct AppIconView: View {
    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
            .resizable()
            .scaledToFit()
            .padding(100)
            .foregroundColor(.white)
        .background(Color.indigo)
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .iconStyle(.macOS)
            .scenePadding()
    }
}

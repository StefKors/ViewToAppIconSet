//
//  SwiftUIView.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import SwiftUI

public struct AppIconView: View {
    let text: String = "Longer Longest Loooongest"
    @State private var wordHeight: CGFloat = 100

    private struct SizePreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = .zero
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = min(value, nextValue())
        }
    }

    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(text.split(separator: " ").map(String.init), id: \.self) { (word: String) in
                Text(word)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .background(GeometryReader {
                        Color.clear.preference(key: SizePreferenceKey.self, value: $0.size.height)
                    })
                    .frame(maxHeight: wordHeight)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self, perform: { wordHeight = $0 })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .frame(width: 156, height: 156)
            .previewLayout(.fixed(width: 256, height: 256))
            .previewDisplayName("256")
    }
}

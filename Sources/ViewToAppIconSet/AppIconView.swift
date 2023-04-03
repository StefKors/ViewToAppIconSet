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
    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
            .resizable()
            .scaledToFit()
            .padding(100)
            .foregroundColor(.white)
            .background(Color.indigo)
    }
}

//
//  Color+Codable.swift
//  FirestoreCodableSamples
//
//  Created by Peter Friese on 18.03.21.
//

import SwiftUI

// Inspired by https://cocoacasts.com/from-hex-to-uicolor-and-back-in-swift
// Make Color codable. This includes support for transparency.
// See https://www.digitalocean.com/community/tutorials/css-hex-code-colors-alpha-values
extension Color: Codable {
    init(hex: String) {
        let rgba = hex.toRGBA()

        self.init(.sRGB,
                  red: Double(rgba.r),
                  green: Double(rgba.g),
                  blue: Double(rgba.b),
                  opacity: Double(rgba.alpha))
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hex = try container.decode(String.self)

        self.init(hex: hex)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(toHex)
    }

    var toHex: String? {
        return toHex()
    }

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor?.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX",
                          lroundf(r * 255),
                          lroundf(g * 255),
                          lroundf(b * 255),
                          lroundf(a * 255))
        }
        else {
            return String(format: "%02lX%02lX%02lX",
                          lroundf(r * 255),
                          lroundf(g * 255),
                          lroundf(b * 255))
        }
    }
}

extension String {
    func toRGBA() -> (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        var hexSanitized = self.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        }
        else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        }

        return (r, g, b, a)
    }
}

extension Color: Identifiable {
    public var id: Color {
        self
    }
}


extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard let hsbColor = NSColor(self).usingColorSpace(NSColorSpace.deviceRGB) else {
            return (r, g, b, o)
        }

        r = hsbColor.redComponent
        g = hsbColor.greenComponent
        b = hsbColor.blueComponent
        o = hsbColor.alphaComponent

        return (r, g, b, o)
    }

    func lighter(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> Color {
        return Color(red: min(Double(self.components.red + percentage/100), 1.0),
                     green: min(Double(self.components.green + percentage/100), 1.0),
                     blue: min(Double(self.components.blue + percentage/100), 1.0),
                     opacity: Double(self.components.opacity))
    }
}



struct AppIcon: View {
    var color: Color

    private let padding: CGFloat = 30

    var body: some View {
        let filled = LinearGradient(
            gradient: Gradient(
                colors: [
                    color.lighter(by: 10),
                    color.darker(by: 5),
                ]
            ),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )



        ContainerRelativeShape()
            .fill(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            color.lighter(by: 20),
                            color.darker(by: 5),
                        ]
                    ),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                )
            )
            .overlay {
                RoundedRectangle(cornerRadius: 85)
                    .fill(filled)
                    .shadow(color: color.darker(by: 15), radius: 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 75)
                            .fill(filled)
                            .shadow(color: color.darker(by: 15), radius: 10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 60)
                                    .fill(filled)
                                    .shadow(color: color.darker(by: 15), radius: 10)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 45)
                                            .fill(filled)
                                            .shadow(color: color.darker(by: 15), radius: 10)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 30)
                                                    .fill(filled)
                                                    .shadow(color: color.darker(by: 15), radius: 10)
                                                    .padding(padding)
                                            }
                                            .padding(padding)
                                    }
                                    .padding(padding)
                            }
                            .padding(padding)
                    }
                    .padding(padding)
            }
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                AppIcon(color: Color(red: 0.533, green: 0.271, blue: 0.835))
                    .iconStyle(.macOS)
                    .scenePadding()

                AppIcon(color: Color(red: 0.0282567, green: 0.355162, blue: 0.349388))
                    .iconStyle(.macOS)
                    .scenePadding()

                AppIcon(color: Color(red: 0.826886, green: 0.451385, blue: 0.38428))
                    .iconStyle(.macOS)
                    .scenePadding()
            }

            HStack {
                AppIcon(color: Color(red: 0.184314, green: 0.0117647, blue: 0.92549))
                    .iconStyle(.macOS)
                    .scenePadding()

                AppIcon(color: Color(red: 0.928672, green: 0.600593, blue: 0.215507))
                    .iconStyle(.macOS)
                    .scenePadding()

                AppIcon(color: Color(red: 0.473434, green: 0.586395, blue: 0.188347))
                    .iconStyle(.macOS)
                    .scenePadding()
            }
        }
    }
}

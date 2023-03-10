import XCTest
import ViewToAppIconSet
import SwiftUI

class Helpers {
    static func fileExists(at path: URL, shouldBeDirectory: Bool = false) {
        var isDirectory: ObjCBool = false
        XCTAssertTrue(FileManager.default.fileExists(atPath: path.path, isDirectory: &isDirectory))
        XCTAssertEqual(isDirectory.boolValue, shouldBeDirectory)
    }
}

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

import SwiftUI

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
    var body: some View {
        Rectangle()
            .fill(color)
            .overlay {
                ZStack {
                    Circle()
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

                    Circle()
                        .stroke(color.darker(by: 2), lineWidth: 1)
                }
                .shadow(color: color.darker(by: 3), radius: 10, y: -5)
                .shadow(color: color.darker(by: 3).opacity(0.3), radius: 5, x: -5, y: -5)
                .shadow(color: color.lighter(by: 10).opacity(0.2), radius: 4, x: 3, y: 3)
                .padding(40)
            }
    }
}

final class ViewToAppIconSetTests: XCTestCase {
    func testNumberOfAppIcons() throws {
        let sizes = Contents().images
        XCTAssertEqual(sizes.count, 28)
    }

    func testNumberOfUniqueFileNames() throws {
        XCTAssertEqual(Contents().uniqueFileNames.count, 25)
    }

    @MainActor func testImageRenderer() throws {
        let path = try generateAppIconSet(from: AppIcon(color: Color(red: 0.533, green: 0.271, blue: 0.835)))

        // Assert the folder is created
        Helpers.fileExists(at: URL(fileURLWithPath: path), shouldBeDirectory: true)

        // Confirm the number of files
        let filesInFolder = try FileManager.default.contentsOfDirectory(atPath: path)

        // Expected fileCount, all uniqueFileNames plus the "Content.json" file
        let fileCount = Contents().uniqueFileNames.count + 1
        XCTAssertEqual(filesInFolder.count, fileCount)
    }
}

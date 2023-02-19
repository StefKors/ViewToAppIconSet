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

final class ViewToAppIconSetTests: XCTestCase {
    func testNumberOfAppIcons() throws {
        let sizes = Contents().images
        XCTAssertEqual(sizes.count, 28)
    }

    func testNumberOfUniqueFileNames() throws {
        XCTAssertEqual(Contents().uniqueFileNames.count, 25)
    }

    func testWritingFiles() throws {
        // Write View to AppIconSet
        let view = ZStack {
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
        let path = try convertViewToAppIconSet(Color.green)

        // Assert the folder is created
        Helpers.fileExists(at: URL(fileURLWithPath: path), shouldBeDirectory: true)

        // Confirm the number of files
        let filesInFolder = try FileManager.default.contentsOfDirectory(atPath: path)

        // Expected fileCount, all uniqueFileNames plus the "Content.json" file
        let fileCount = Contents().uniqueFileNames.count + 1
        XCTAssertEqual(filesInFolder.count, fileCount)
    }
}

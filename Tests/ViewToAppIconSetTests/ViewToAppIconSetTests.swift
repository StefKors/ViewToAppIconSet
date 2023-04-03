import XCTest
import ViewToAppIconSet
import SwiftUI

private class Helpers {
    static func fileExists(at path: URL, shouldBeDirectory: Bool = false) {
        var isDirectory: ObjCBool = false
        XCTAssertTrue(FileManager.default.fileExists(atPath: path.path, isDirectory: &isDirectory))
        XCTAssertEqual(isDirectory.boolValue, shouldBeDirectory)
    }
}

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

final class ViewToAppIconSetTests: XCTestCase {
    func testNumberOfAppIcons() throws {
        let sizes = Contents().images
        XCTAssertEqual(sizes.count, 28)
    }

    func testNumberOfUniqueFileNames() throws {
        XCTAssertEqual(Contents().uniqueFileNames.count, 25)
    }

    @MainActor func testImageRenderer() throws {
        let path = try generateAppIconSet(from: AppIconView())

        // Assert the folder is created
        Helpers.fileExists(at: URL(fileURLWithPath: path), shouldBeDirectory: true)

        // Confirm the number of files
        let filesInFolder = try FileManager.default.contentsOfDirectory(atPath: path)

        // Expected fileCount, all uniqueFileNames plus the "Content.json" file
        let fileCount = Contents().uniqueFileNames.count + 1
        print(path.description)
        XCTAssertEqual(filesInFolder.count, fileCount)
    }
}

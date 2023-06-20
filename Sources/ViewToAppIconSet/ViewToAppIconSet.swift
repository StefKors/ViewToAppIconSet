//
//  ViewToAppIconSet.swift
//  ViewToAppIconSet
//
//  Created by Stef Kors on 15/02/2023.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

/// Write Contents.json file
/// - Parameter folder: target folder
fileprivate func writeContentFile(to folder: String) throws {
    // write json file to it
    let jsonFileName = "Contents.json"
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(Contents())
    let jsonURL = URL(fileURLWithPath: folder).appendingPathComponent(jsonFileName)
    try data.write(to: jsonURL)
}

/// Removes and Creates a folder at location
/// - Parameter folder: target folder
fileprivate func createFolder(at folder: String) throws {
    try? FileManager.default.removeItem(atPath: folder)
    try FileManager.default.createDirectory(atPath: folder, withIntermediateDirectories: true)
}

#if os(macOS)
/// Write an NSImage to a png file at the provided path
/// - Parameters:
///   - image: image to render
///   - path: location to write the png to
/// - Throws: throws when writing fails
fileprivate func writePNG(image: NSImage, path:String) throws {
    let imageRep = NSBitmapImageRep(data: image.tiffRepresentation!)
    let pngData = imageRep?.representation(using: .png, properties: [:])
    try pngData?.write(to: URL(filePath: path))
}
#else
/// Write an UIImage to a png file at the provided path
/// - Parameters:
///   - image: image to render
///   - path: location to write the png to
/// - Throws: throws when writing fails
fileprivate func writePNG(image: UIImage, path:String) throws {
    try image.pngData()?.write(to: URL(filePath: path))
}
#endif

/// Converts provided SwiftUI View to an AppIcon.AppIconSet.
///
/// For best results, provide a the view at 512x512
///
/// ```swift
/// let path = try generateAppIconSet(from: AppIcon())
/// ```
/// - Parameter view: view to render
/// - Returns: path of temporary directory where the AppIcon.AppIconSet folder is located
@MainActor public func generateAppIconSet(from view: some View) throws -> String {
    let folder = NSTemporaryDirectory() + "AppIcon.appiconset/"
    try createFolder(at: folder)
    try writeContentFile(to: folder)

    let contents = Contents()
    try contents.images.forEach { iconInfo in
        let iconView = view
            .iconStyle(iconInfo.iconStyle)
            .frame(width: iconInfo.size, height: iconInfo.size, alignment: .center)
        let renderer = ImageRenderer(content: iconView)
        renderer.scale = iconInfo.scale
        renderer.proposedSize = .init(width: iconInfo.size, height: iconInfo.size)
#if os(macOS)
        guard let image = renderer.nsImage  else { return }
#else
        guard let image = renderer.uiImage else { return }
#endif
        try writePNG(image: image, path: folder + iconInfo.filename)
    }

    return folder
}

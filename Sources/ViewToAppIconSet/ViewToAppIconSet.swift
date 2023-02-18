//
//  ViewToAppIconSet.swift
//  ViewToAppIconSet
//
//  Created by Stef Kors on 15/02/2023.
//

import Foundation
import SwiftUI

public struct ViewToAppIconSet {
    public private(set) var text = "Hello, World!"

    private let contents = Contents()

    public init() {
    }

    /// Rasterize NSView to bitmap
    /// - Parameters:
    ///   - view: source view
    ///   - format: BitMap format
    /// - Returns: Image Data
    private func rasterize(view: NSView, format: NSBitmapImageRep.FileType) -> Data? {
        guard let bitmapRepresentation = view.bitmapImageRepForCachingDisplay(in: view.bounds) else {
            return nil
        }
        bitmapRepresentation.size = view.bounds.size
        view.cacheDisplay(in: view.bounds, to: bitmapRepresentation)
        return bitmapRepresentation.representation(using: format, properties: [
            .interlaced: true
        ])
    }

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

    /// Write SwiftUI View to folder
    /// - Parameters:
    ///   - swiftUIView: the view to write
    ///   - folder: target folder
    fileprivate func writeImageFiles(_ swiftUIView: some View, _ folder: String) throws {
        // write image files to it
        try contents.images.forEach { iconInfo in
            let size = iconInfo.size * iconInfo.scale
            let iconView = swiftUIView

            let wrapper = NSHostingView(rootView: iconView)

            wrapper.frame = CGRect(x: 0, y: 0, width: size/2, height: size/2)
            guard let png = rasterize(view: wrapper, format: .png) else {
                print("failed to rasterize")
                return
            }

            let url = URL(fileURLWithPath: folder).appendingPathComponent(iconInfo.filename)
            print("writing \(iconInfo.filename) to size: \(size)x\(size)")
            try png.write(to: url)
            let assertFileExists = FileManager.default.fileExists(atPath: folder + iconInfo.filename)
            if !assertFileExists {
                fatalError("file does not exists \(url.absoluteString)")
            }
        }
    }

    /// Removes and Creates a folder at location
    /// - Parameter folder: target folder
    fileprivate func createFolder(at folder: String) throws {
        try? FileManager.default.removeItem(atPath: folder)
        try FileManager.default.createDirectory(atPath: folder, withIntermediateDirectories: true)
    }

    public func viewToAppIconSet(_ swiftUIView: some View) throws -> String {
        let folder = NSTemporaryDirectory() + "AppIcon.appiconset/"
        try createFolder(at: folder)
        try writeContentFile(to: folder)
        try writeImageFiles(swiftUIView, folder)
        return folder
    }
}

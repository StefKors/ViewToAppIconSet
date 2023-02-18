//
//  Contents.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import Foundation

public struct Contents: Codable {
    public let info: Info
    public var images: [Image] = [
        Image(
            idiom: "iphone",
            size: 20,
            scale: 2,
            filename: "notification40.png"
        ),
        Image(
            idiom: "iphone",
            size: 20,
            scale: 3,
            filename: "notification60.png"
        ),
        Image(
            idiom: "iphone",
            size: 29,
            scale: 2,
            filename: "settings58.png"
        ),
        Image(
            idiom: "iphone",
            size: 29,
            scale: 3,
            filename: "settings87.png"
        ),
        Image(
            idiom: "iphone",
            size: 40,
            scale: 2,
            filename: "spotlight80.png"
        ),
        Image(
            idiom: "iphone",
            size: 40,
            scale: 3,
            filename: "spotlight120.png"
        ),
        Image(
            idiom: "iphone",
            size: 60,
            scale: 2,
            filename: "iphone120.png"
        ),
        Image(
            idiom: "iphone",
            size: 60,
            scale: 3,
            filename: "iphone180.png"
        ),
        Image(
            idiom: "ipad",
            size: 20,
            scale: 1,
            filename: "ipadNotification20.png"
        ),
        Image(
            idiom: "ipad",
            size: 20,
            scale: 2,
            filename: "ipadNotification40.png"
        ),
        Image(
            idiom: "ipad",
            size: 29,
            scale: 1,
            filename: "ipadSettings29.png"
        ),
        Image(
            idiom: "ipad",
            size: 29,
            scale: 2,
            filename: "ipadSettings58.png"
        ),
        Image(
            idiom: "ipad",
            size: 40,
            scale: 1,
            filename: "ipadSpotlight40.png"
        ),
        Image(
            idiom: "ipad",
            size: 40,
            scale: 2,
            filename: "ipadSpotlight80.png"
        ),
        Image(
            idiom: "ipad",
            size: 76,
            scale: 1,
            filename: "ipad76.png"
        ),
        Image(
            idiom: "ipad",
            size: 76,
            scale: 2,
            filename: "ipad152.png"
        ),
        Image(
            idiom: "ipad",
            size: 83.5,
            scale: 2,
            filename: "ipadPro167.png"
        ),
        Image(
            idiom: "ios-marketing",
            size: 1024,
            scale: 1,
            filename: "appstore1024.png"
        ),
        Image(
            idiom: "mac",
            size: 16,
            scale: 1,
            filename: "mac16.png"
        ),
        Image(
            idiom: "mac",
            size: 16,
            scale: 2,
            filename: "mac32.png"
        ),
        Image(
            idiom: "mac",
            size: 32,
            scale: 1,
            filename: "mac32.png"
        ),
        Image(
            idiom: "mac",
            size: 32,
            scale: 2,
            filename: "mac64.png"
        ),
        Image(
            idiom: "mac",
            size: 128,
            scale: 1,
            filename: "mac128.png"
        ),
        Image(
            idiom: "mac",
            size: 128,
            scale: 2,
            filename: "mac256.png"
        ),
        Image(
            idiom: "mac",
            size: 256,
            scale: 1,
            filename: "mac256.png"
        ),
        Image(
            idiom: "mac",
            size: 256,
            scale: 2,
            filename: "mac512.png"
        ),
        Image(
            idiom: "mac",
            size: 512,
            scale: 1,
            filename: "mac512.png"
        ),
        Image(
            idiom: "mac",
            size: 512,
            scale: 2,
            filename: "mac1024.png"
        ),
    ]

    public var uniqueFileNames: [String] {
        let allFileNames = self.images.compactMap { $0.filename }
        return Array(Set(allFileNames))
    }

    public init(version: Int = 1, author: String = "ViewToAppIconSet") {
        self.info = .init(version: version, author: author)
    }
}

//
//  Contents.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import Foundation

/**
Used to generate the `Contents.json` file.
```json
{
    "info" : {
        "version" : 1,
        "author"  : "ColorPicker"
    },
    "images" : [
        {
            "idiom" : "iphone",
            "size"  : "20x20",
            "scale" : "2x",
            "filename" : "notification40.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "20x20",
            "scale" : "3x",
            "filename" : "notification60.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "29x29",
            "scale" : "2x",
            "filename" : "settings58.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "29x29",
            "scale" : "3x",
            "filename" : "settings87.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "40x40",
            "scale" : "2x",
            "filename" : "spotlight80.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "40x40",
            "scale" : "3x",
            "filename" : "spotlight120.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "60x60",
            "scale" : "2x",
            "filename" : "iphone120.png"
        },
        {
            "idiom" : "iphone",
            "size"  : "60x60",
            "scale" : "3x",
            "filename" : "iphone180.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "20x20",
            "scale" : "1x",
            "filename" : "ipadNotification20.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "20x20",
            "scale" : "2x",
            "filename" : "ipadNotification40.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "29x29",
            "scale" : "1x",
            "filename" : "ipadSettings29.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "29x29",
            "scale" : "2x",
            "filename" : "ipadSettings58.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "40x40",
            "scale" : "1x",
            "filename" : "ipadSpotlight40.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "40x40",
            "scale" : "2x",
            "filename" : "ipadSpotlight80.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "76x76",
            "scale" : "1x",
            "filename" : "ipad76.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "76x76",
            "scale" : "2x",
            "filename" : "ipad152.png"
        },
        {
            "idiom" : "ipad",
            "size"  : "83.5x83.5",
            "scale" : "2x",
            "filename" : "ipadPro167.png"
        },
        {
            "idiom" : "ios-marketing",
            "size"  : "1024x1024",
            "scale" : "1x",
            "filename" : "appstore1024.png"
        },
        {
            "idiom" : "mac",
            "size"  : "16x16",
            "scale" : "1x",
            "filename" : "mac16.png"
        },
        {
            "idiom" : "mac",
            "size"  : "16x16",
            "scale" : "2x",
            "filename" : "mac32.png"
        },
        {
            "idiom" : "mac",
            "size"  : "32x32",
            "scale" : "1x",
            "filename" : "mac32.png"
        },
        {
            "idiom" : "mac",
            "size"  : "32x32",
            "scale" : "2x",
            "filename" : "mac64.png"
        },
        {
            "idiom" : "mac",
            "size"  : "128x128",
            "scale" : "1x",
            "filename" : "mac128.png"
        },
        {
            "idiom" : "mac",
            "size"  : "128x128",
            "scale" : "2x",
            "filename" : "mac256.png"
        },
        {
            "idiom" : "mac",
            "size"  : "256x256",
            "scale" : "1x",
            "filename" : "mac256.png"
        },
        {
            "idiom" : "mac",
            "size"  : "256x256",
            "scale" : "2x",
            "filename" : "mac512.png"
        },
        {
            "idiom" : "mac",
            "size"  : "512x512",
            "scale" : "1x",
            "filename" : "mac512.png"
        },
        {
            "idiom" : "mac",
            "size"  : "512x512",
            "scale" : "2x",
            "filename" : "mac1024.png"
        }
    ]
}

```
*/
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

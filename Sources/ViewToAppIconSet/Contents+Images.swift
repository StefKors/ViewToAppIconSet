//
//  File.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import Foundation

extension Contents {
    public struct Image: Encodable {
        public let idiom: String
        public let size: Double
        public let scale: Double
        public let filename: String
        public let iconStyle: IconStyle

        enum CodingKeys: CodingKey {
            case idiom
            case size
            case scale
            case filename
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: Contents.Image.CodingKeys.self)

            try container.encode(self.idiom, forKey: Contents.Image.CodingKeys.idiom)
            let sizeString = "\(self.size.removeDecimals)x\(self.size.removeDecimals)"
            try container.encode(sizeString, forKey: Contents.Image.CodingKeys.size)
            let scaleString = "\(self.scale.removeDecimals)x"
            try container.encode(scaleString, forKey: Contents.Image.CodingKeys.scale)
            try container.encode(self.filename, forKey: Contents.Image.CodingKeys.filename)
        }
    }
}


fileprivate extension Double {
    var removeDecimals: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

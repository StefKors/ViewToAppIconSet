//
//  File.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import Foundation

extension Contents {
    public struct Image: Codable {
        public init(idiom: String, size: Double, scale: Double, filename: String) {
            self.idiom = idiom
            self.size = size
            self.scale = scale
            self.filename = filename
        }

        public let idiom: String
        public let size: Double
        public let scale: Double
        public let filename: String

        enum CodingKeys: CodingKey {
            case idiom
            case size
            case scale
            case filename
        }

        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<Contents.Image.CodingKeys> = try decoder.container(keyedBy: Contents.Image.CodingKeys.self)

            self.idiom = try container.decode(String.self, forKey: Contents.Image.CodingKeys.idiom)
            let sizeString = try container.decode(String.self, forKey: Contents.Image.CodingKeys.size)
            self.size = Self.decodeSize(for: sizeString)

            let scaleString = try container.decode(String.self, forKey: Contents.Image.CodingKeys.scale)
            self.scale = Self.decodeScale(for: scaleString)
            self.filename = try container.decode(String.self, forKey: Contents.Image.CodingKeys.filename)

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

        private static func decodeSize(for val: String) -> Double {
            guard let first = val.split(separator: "x").first else {
                return 0
            }
            return Double(Int(first) ?? 0)
        }

        private static func decodeScale(for val: String) -> Double {
            guard let first = val.first else { return 1 }
            return Double(Int(String(first)) ?? 1)
        }
    }
}


fileprivate extension Double {
    var removeDecimals: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

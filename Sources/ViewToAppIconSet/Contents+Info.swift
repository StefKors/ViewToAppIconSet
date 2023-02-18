//
//  Content+Info.swift
//  
//
//  Created by Stef Kors on 18/02/2023.
//

import Foundation

extension Contents {
    public struct Info: Codable {
        public let version: Int
        public let author: String
    }
}

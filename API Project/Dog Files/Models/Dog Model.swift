//
//  Dog Model.swift
//  API Project
//
//  Created by Jacob Davis on 12/5/23.
//

import Foundation

struct Dog: Decodable {
    var imageURL: URL
    
    enum DogCodingKeys: String, CodingKey {
        case imageURL = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DogCodingKeys.self)
        self.imageURL = try container.decode(URL.self, forKey: .imageURL)
    }
}



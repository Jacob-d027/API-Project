//
//  Representative.swift
//  API Project
//
//  Created by Jacob Davis on 12/5/23.
//

import Foundation

struct Representative: Codable {
    var name: String
    var party: String
    var link: String
    
    enum RepresentativeCodingKeys: CodingKey {
        case name
        case party
        case link
    }
    

}

// Intermediate struct to receive the list of results
struct SearchResponse: Codable {
    let results: [Representative]
}

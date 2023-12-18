//
//  RepresentativeController.swift
//  API Project
//
//  Created by Jacob Davis on 12/5/23.
//

import Foundation

enum RepresentativeFetchingError: Error {
    case representativesNotFound
}

class RepresentativeController: Decodable {
    func fetchRepresentatives(from zipcode: String) async throws -> SearchResponse {
        
        var baseURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php")!
        baseURL.append(queryItems: [
            URLQueryItem(name: "zip", value: zipcode),
            URLQueryItem(name: "output", value: "json")
        ])
        
        do {
            let (data, response) = try await URLSession.shared.data(from: baseURL)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw RepresentativeFetchingError.representativesNotFound
            }
            
            print(String(data: data, encoding: .utf8) ?? "error")
            let jsonDecoder = JSONDecoder()
            let searchResponse = try jsonDecoder.decode(SearchResponse.self, from: data)
            
            return searchResponse
        } catch {
            throw error // Bubbling up
        }
    }
}

//
//  DogController.swift
//  API Project
//
//  Created by Jacob Davis on 12/5/23.
//

import Foundation

enum DogFetchingError: Error {
    case dogNotFound
}

class DogController: Decodable {
    
    func fetchRandomDog() async throws -> Dog {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw DogFetchingError.dogNotFound }
        
        let jsonDecoder = JSONDecoder()
        let dog = try jsonDecoder.decode(Dog.self, from: data)
        
        return dog
    }
    
    func fetchRandomImage(for url: URL) async throws -> Data {
        let (imageData, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw DogFetchingError.dogNotFound }
        
        return imageData
    }
    
}

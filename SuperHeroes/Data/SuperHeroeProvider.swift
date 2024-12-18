//
//  SuperHeroeProvider.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import Foundation

class SuperHeroeProvider{
    
    
    
    static func findSuperheroesBy(name: String) async throws -> [DataHero] {
            let url = URL(string: "https://superheroapi.com/api/d185787618b6c92dbb52a73ac316744e/search/\(name)")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(SuperHeroeResponse.self, from: data)
            
        return result.results
        }
        
        static func findSuperheroesBy(id: String) async throws -> DataHero {
            let url = URL(string: "https://superheroapi.com/api/d185787618b6c92dbb52a73ac316744e/\(id)")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(DataHero.self, from: data)
            
            return result
        }
}

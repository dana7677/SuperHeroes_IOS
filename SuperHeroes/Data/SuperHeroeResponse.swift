//
//  SuperHeroeResponse.swift
//  SuperHeroes
//
//  Created by Tardes on 18/12/24.
//

import Foundation

struct SuperHeroeResponse:Codable {
    
    let results: [DataHero]
    
    
}

struct DataHero:Codable{
    
    let id: String
    let name: String
    let image: Image
    let biography: Biography
    let powerstats: PowerStats
    let appearance: Appearance
    let work: Work
    let connections: Connections
    
}

struct  PowerStats:Codable{
    
    let intelligence:String
    let strength:String
    let speed:String
    let durability:String
    let power:String
    let combat:String
}

struct  Biography:Codable{
    
    let fullName:String
    let alterEgo:String
    let alias:[String]
    let placeBirth:String
    let firstAppearance:String
    let publisher:String
    let alignment:String
    
    private enum CodingKeys: String, CodingKey{
        case fullName = "full-name"
        case alterEgo = "alter-egos"
        case alias = "aliases"
        case placeBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher = "publisher"
        case alignment = "alignment"
    }
}

struct Appearance:Codable {
    let gender:String
    let race:String
    let height:[String]
    let weight:[String]
    let eyesColor:String
    let hairColor:String
    
    private enum CodingKeys: String, CodingKey{
        
        case gender, race, height, weight
        case eyesColor = "eye-color"
        case hairColor = "hair-color"
    }
}

struct Work: Codable {
    let occupation:String
    let base:String
}

struct Connections: Codable {
    let group:String
    let relatives:String
    
    private enum CodingKeys: String, CodingKey{
        case relatives
        case group = "group-affiliation"
    }
}

struct Image: Codable {
    let url: String
}




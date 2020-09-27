//
//  Meme.swift
//  Meme
//
//  Created by jonathan ferrer on 9/24/20.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    
    let id: String
    let name: String
    let category: String
    let thumbnail: String
    let instructions: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case thumbnail = "strDrinkThumb"
        case instructions = "strInstructions"
    }
}

//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String
  
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case description = "description"
        case category = "category"
    }
}

enum MenuCategory: String, CaseIterable {
    case starters
    case mains
    case desserts
    case drinks
}

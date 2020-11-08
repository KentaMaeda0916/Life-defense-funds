//
//  Date.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/17.
//  Copyright © 2020 maeken. All rights reserved.
//

import Foundation

struct ItemStore {
    let items: [ItemEntity] = load("orderEntity.json")
}
let itemStore = ItemStore()

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

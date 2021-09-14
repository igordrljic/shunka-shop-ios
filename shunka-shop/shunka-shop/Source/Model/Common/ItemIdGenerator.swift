//
//  ListItemIdGenerator.swift
//  shunka-shop
//
//  Created by Igor Drljic on 5.8.21..
//

class ItemIdGenerator {
    private var id: Int = 0
    
    func generateId() -> Int {
        let newId = id
        id += 1
        return newId
    }
}

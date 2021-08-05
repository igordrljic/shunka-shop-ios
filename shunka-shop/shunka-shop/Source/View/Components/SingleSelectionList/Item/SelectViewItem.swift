//
//  SelectViewItem.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import Combine
import Foundation

class SelectViewItem: ObservableObject, Identifiable {
    let id: Int
    let title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

//
//  SelectViewItem.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import Combine
import Foundation

class SelectViewItem: ObservableObject, Identifiable {
    let id = UUID()
    let title: String
    @Published var isSelected: Bool
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}

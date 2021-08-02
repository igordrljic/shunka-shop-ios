//
//  SingleSelectViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import Combine

class SingleSelectViewModel: ObservableObject {
    @Published var items: [SelectViewItem]
    
    init(items: [SelectViewItem]) {
        self.items = items
    }
}

//
//  SingleSelectViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import Combine

extension SingleSelectionList {
    class ViewModel: ObservableObject {
        @Published private(set) var selectedObject: Object?
        @Published private(set) var selectedItemId: Int?
        let items: [SelectViewItem]
        
        private let objects: [Object]
        
        init(objects: [Object], selectedItemIndex: Int? = nil) {
            self.objects = objects
            if let selectedItemIndex = selectedItemIndex {
                self.selectedItemId = selectedItemIndex
                self.selectedObject = objects[selectedItemIndex]
            }
            let itemIdGenerator = ItemIdGenerator()
            self.items = objects.compactMap {
                SelectViewItem(id: itemIdGenerator.generateId(), title: $0.description)
            }
        }
                
        func setSelected(_ itemId: Int?) {
            if let itemId = itemId, selectedItemId == itemId {
                selectedItemId = nil
            } else {
                selectedItemId = itemId
            }
        }
        
        func confirmSelection() {
            if let selectedItemId = selectedItemId {
                self.selectedObject = objects[selectedItemId]
            } else {
                self.selectedObject = nil
            }
        }
    }
}

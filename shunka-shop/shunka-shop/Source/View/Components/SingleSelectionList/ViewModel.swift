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
        let items: [SelectViewItem]
        
        private let objects: [Object]
        private var selectedItemId: Int?
        
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
                
        func isSelected(_ itemId: Int) -> Bool {
            guard let selectedItemId = selectedItemId else {
                return false
            }
            return selectedItemId == itemId
        }
        
        func setSelected(_ itemId: Int?) {
            selectedItemId = itemId
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

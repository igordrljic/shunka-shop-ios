//
//  SingleSelectViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import Combine

extension SingleSelectionList {
    class ViewModel: ObservableObject {
        @Published private(set) var selectedItemId: Int?
        let items: [SelectViewItem]
        private let objects: [Object]
        private let selectionHandler: (Object?) -> Void
        
        init(objects: [Object],
             selectedItemIndex: Int? = nil,
             selectionHandler: @escaping (Object?) -> Void) {
            self.objects = objects
            self.selectedItemId = selectedItemIndex
            self.selectionHandler = selectionHandler
            let itemIdGenerator = ItemIdGenerator()
            self.items = objects.compactMap {
                SelectViewItem(id: itemIdGenerator.nextId(), title: $0.presentableName)
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
            if let itemIndex = itemId {
                selectionHandler(objects[itemIndex])
            } else {
                selectionHandler(nil)
            }
        }
    }
}

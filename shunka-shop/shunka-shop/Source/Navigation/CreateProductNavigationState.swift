//
//  CreateProductNavigationState.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Combine

class CreateProductNavigationState: ObservableObject {
    @Published var isCreateProductPresented = false
}

extension CreateProductNavigationState {
    func clear() {
        dismissCreateProduct()
    }
    
    func presentCreateProduct() {
        isCreateProductPresented = true
    }
    
    func dismissCreateProduct() {
        isCreateProductPresented = false
    }
}

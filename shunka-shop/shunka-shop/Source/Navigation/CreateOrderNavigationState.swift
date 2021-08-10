//
//  CreateOrderNavigationState.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Combine

class CreateOrderNavigationState: ObservableObject {
    @Published var isCreateOrderPresented = false
    @Published var isSelectCustomerPresented = false
}

extension CreateOrderNavigationState {
    
    func clear() {
        dismissSelectCustomer()
        dismissCreateOrder()
    }
    
    func presentCreateOrder() {
        isCreateOrderPresented = true
    }
    
    func dismissCreateOrder() {
        isCreateOrderPresented = false
    }
    
    func presentSelectCustomer() {
        isSelectCustomerPresented = true
    }
    
    func dismissSelectCustomer() {
        isSelectCustomerPresented = false
    }
}

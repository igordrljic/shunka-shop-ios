//
//  OrderListViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation
import Combine

class OrderListViewModel: ObservableObject {
    @Published var orders: [Order] = []
    @Published var error: PresentableError?
    @Published var isWorking: Bool = false
    
    private let getOrders: GetOrders
    private let orderStorage: OrderStorage
    private var isLoaded = false
    private lazy var orderStream: AnyCancellable = {
        orderStorage.storageUpdatePublisher.sink { orders in
            self.orders = orders
        }
    }()
    
    init(orderService: OrderService = ServiceInjector.shared.order,
         orderStorage: OrderStorage = DataStorageInjector.shared.order) {
        self.orderStorage = orderStorage
        self.getOrders = GetOrders(orderService: orderService,
                                   orderStorage: orderStorage)
        _ = orderStream
    }
    
    func load() {
        guard !isLoaded else {
            return
        }
        isLoaded = true
        reload()
    }
    
    func reload() {
        guard !isWorking else {
            return
        }
        isWorking = true
        getOrders.execute { result in
            self.isWorking = false
            switch result {
            case .success:
                self.error = nil
            case let .failure(error):
                self.error = PresentableError(message: error.localizedDescription)
            }
        }
    }
}

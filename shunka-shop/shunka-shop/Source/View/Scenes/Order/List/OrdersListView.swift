//
//  OrdersListView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct OrdersListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.orders.isEmpty {
                Text(Strings.noActiveOrders)
            } else {
                List(viewModel.orders) { order in
                    OrderCell(order: order)
                }
                .alert(item: $viewModel.error) { error in
                    Alert(title: Text(error.title),
                          message: Text(error.message),
                          dismissButton: Alert.Button.cancel(Text(Strings.ok)))
                }
            }
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loading)
            }
        }
        .onAppear { viewModel.load() }
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(viewModel: OrderListViewModel())
    }
}

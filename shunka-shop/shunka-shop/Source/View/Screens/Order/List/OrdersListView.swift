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
        List(viewModel.orders) { order in
            OrderCell(order: order)
        }
        .onAppear { viewModel.load() }
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(viewModel: OrderListViewModel())
    }
}

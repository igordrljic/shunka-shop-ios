//
//  ProductListView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct ProductListView: View {
    var products: [Product] = mockProducts
    
    var body: some View {
        List(products) { product in
            ProductCell(product: product)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: mockProducts)
    }
}

private var mockProducts = [
        Product(id: "1",
            name: "Name",
            pricePerKilo: 1300,
            productionYear: 2021,
            pruductionMonth: 3,
            availableQuantity: 25.5)
    ]

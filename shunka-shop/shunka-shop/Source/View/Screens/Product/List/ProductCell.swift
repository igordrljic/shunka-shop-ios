//
//  ProductCell.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct ProductCell: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(product.name)
                .font(.body)
                .foregroundColor(.primaryText)
                .padding(.bottom, 4)
            Group {
                Text(product.productionDateCaption)
                Text(product.priceCaption)
                Text(product.producedQuantityCaption)
                Text(product.availableQuantityCaption)
            }
            .font(.footnote)
            .foregroundColor(.secondaryText)
        }
        .padding(.vertical)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: product)
    }
}

private extension Product {
    var priceCaption: String {
        "\(Strings.productPricePerKilo): \(pricePerKilo) \(Strings.currency)/\(Strings.kilogram)"
    }
    var productionDateCaption: String {
        if let month = Month(rawValue: productionMonth)?.name {
            return "\(Strings.productDateOfProduction): \(month) \(productionYear)"
        } else {
            return "\(Strings.productDateOfProduction): \(productionYear)"
        }
    }
    var producedQuantityCaption: String {
        "\(Strings.productProducedQuantity): \(producedQuantity) \(Strings.kilogram)"
    }
    var availableQuantityCaption: String {
        "\(Strings.productAvailableQuantity): \(availableQuantity) \(Strings.kilogram)"
    }
}

private var product = Product(id: "1",
                              name: "Name",
                              pricePerKilo: 1300,
                              productionYear: 2021,
                              productionMonth: 3,
                              producedQuantity: 25.5,
                              availableQuantity: 20.7)

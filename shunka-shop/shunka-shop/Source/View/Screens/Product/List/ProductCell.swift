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
        VStack(alignment: .leading, spacing: 8) {
            Text(product.name)
                .font(.body)
                .foregroundColor(.themePrimaryText)
                .padding(.bottom, 4)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 4) {
                    Text(Strings.productDateOfProduction + ":").foregroundColor(.themeSecondaryText)
                    Text(product.productionDateCaption).foregroundColor(.themePrimaryText)
                }
                HStack(alignment: .center, spacing: 4) {
                    Text(Strings.productPricePerKilo + ":").foregroundColor(.themeSecondaryText)
                    Text(product.priceCaption).foregroundColor(.themePrimaryText)
                }
                HStack(alignment: .center, spacing: 4) {
                    Text(Strings.productProducedQuantity + ":").foregroundColor(.themeSecondaryText)
                    Text(product.producedQuantityCaption).foregroundColor(.themePrimaryText)
                }
                HStack(alignment: .center, spacing: 4) {
                    Text(Strings.productAvailableQuantity + ":").foregroundColor(.themeSecondaryText)
                    Text(product.availableQuantityCaption).foregroundColor(.themePrimaryText)
                }
            }
            .font(.footnote)
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
        "\(pricePerKilo) \(Strings.currency)/\(Strings.kilogram)"
    }
    var productionDateCaption: String {
        if let month = Month(rawValue: productionMonth)?.name {
            return "\(month) \(productionYear)"
        } else {
            return "\(productionYear)"
        }
    }
    var producedQuantityCaption: String {
        "\(producedQuantity) \(Strings.kilogram)"
    }
    var availableQuantityCaption: String {
        "\(availableQuantity) \(Strings.kilogram)"
    }
}

private var product = Product(id: "1",
                              name: "Name",
                              pricePerKilo: 1300,
                              productionYear: 2021,
                              productionMonth: 3,
                              producedQuantity: 25.5,
                              availableQuantity: 20.7)

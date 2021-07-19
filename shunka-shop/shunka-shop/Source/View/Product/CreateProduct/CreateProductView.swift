//
//  CreateProductView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import SwiftUI

struct CreateProductView: View {
    @ObservedObject var viewModel: CreateProductViewModel
    
    var body: some View {
        return ScrollView(.vertical) {
            VStack(spacing: 30) {
                ForEach(viewModel.fields, id: \.id) { field in
                    view(for: field)
                }
            }
            .padding()
            Button(Strings.register) {
                viewModel.create()
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!viewModel.isFormValid)
            .padding()
        }
    }
    
    private func view(for field: CreateProductViewModel.Field) -> AnyView {
        switch field {
        case .productName:
            return AnyView (
                ErrorTextField(placeholder: Strings.productName,
                               text: $viewModel.productName,
                               error: $viewModel.productNameError)
            )
        case .pricePerKilo:
            return AnyView(
                ErrorTextField(placeholder: Strings.pricePerKilo,
                               text: $viewModel.pricePerKilo,
                               error: $viewModel.pricePerKiloError)
            )
        case .availableQuantity:
            return AnyView(
                ErrorTextField(placeholder: Strings.productAvailableQuantity,
                               text: $viewModel.availableQuantity,
                               error: $viewModel.availableQuantityError)
            )
        case .productionYear:
            return AnyView(
                ErrorTextField(placeholder: Strings.productionYear,
                               text: $viewModel.productionYear,
                               error: $viewModel.productionYearError)
            )
        case .productionMonth:
            return AnyView(
                ErrorTextField(placeholder: Strings.productionMonth,
                               text: $viewModel.productionMonth,
                               error: $viewModel.productionMonthError)
            )
        }
    }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView(viewModel: CreateProductViewModel())
    }
}

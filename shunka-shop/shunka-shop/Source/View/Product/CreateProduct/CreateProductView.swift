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
        ScrollView(.vertical) {
            VStack(spacing: 30) {
                ErrorTextField(placeholder: Strings.productName,
                               text: $viewModel.productName,
                               error: $viewModel.validator.productNameError)
                ErrorTextField(placeholder: Strings.pricePerKilo,
                               text: $viewModel.pricePerKilo,
                               error: $viewModel.validator.pricePerKiloError)
                ErrorTextField(placeholder: Strings.productAvailableQuantity,
                               text: $viewModel.availableQuantity,
                               error: $viewModel.validator.availableQuantityError)
                ErrorTextField(placeholder: Strings.productionYear,
                               text: $viewModel.productionYear,
                               error: $viewModel.validator.productionYearError)
                ErrorTextField(placeholder: Strings.productionMonth,
                               text: $viewModel.productionMonth,
                               error: $viewModel.validator.productionMonthError)
            }
            .padding()
            Button(Strings.register) {
                viewModel.create()
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!viewModel.validator.isFormValid)
            .padding()
        }
    }
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView(viewModel: CreateProductViewModel())
    }
}

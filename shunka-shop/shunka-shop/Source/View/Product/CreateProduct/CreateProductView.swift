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
        debugPrint("*** draw...")
        return ScrollView(.vertical) {
            VStack(spacing: 30) {
                ErrorTextField(placeholder: Strings.productName,
                               text: $viewModel.productName,
                               error: $viewModel.productNameError)
                ErrorTextField(placeholder: Strings.pricePerKilo,
                               text: $viewModel.pricePerKilo,
                               error: $viewModel.pricePerKiloError)
                ErrorTextField(placeholder: Strings.productAvailableQuantity,
                               text: $viewModel.availableQuantity,
                               error: $viewModel.availableQuantityError)
                ErrorTextField(placeholder: Strings.productionYear,
                               text: $viewModel.productionYear,
                               error: $viewModel.productionYearError)
                ErrorTextField(placeholder: Strings.productionMonth,
                               text: $viewModel.productionMonth,
                               error: $viewModel.productionMonthError)
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
}

struct CreateProductView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductView(viewModel: CreateProductViewModel())
    }
}

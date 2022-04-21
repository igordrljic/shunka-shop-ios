//
//  CreateProductView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import SwiftUI

struct CreateProductView: View {
    @ObservedObject var viewModel: CreateProductViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
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
            .alert(item: $viewModel.createProductResult) { result in
                switch result {
                case let .success(message):
                    let button = Alert.Button.default(Text(Strings.ok)) {
                        self.isPresented = false
                    }
                    return Alert(title: Text(""),
                                 message: Text(message),
                                 dismissButton: button)
                case let .failure(error):
                    return Alert(title: Text(Strings.error),
                                 message: Text(error.localizedDescription),
                                 dismissButton: Alert.Button.default(Text(Strings.ok)))
                }
            }
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loading)
            }
        }
    }
    
    private func view(for field: CreateProductViewModel.Field) -> AnyView {
        switch field {
        case .productName:
            return AnyView (
                ErrorTextField(placeholder: Strings.productName,
                               alignment: .leading,
                               text: $viewModel.productName,
                               error: $viewModel.productNameError)
            )
        case .pricePerKilo:
            return AnyView(
                ErrorTextField(placeholder: Strings.pricePerKilo,
                               alignment: .leading,
                               text: $viewModel.pricePerKilo,
                               error: $viewModel.pricePerKiloError)
            )
        case .producedQuantity:
            return AnyView(
                ErrorTextField(placeholder: Strings.productProducedQuantity,
                               alignment: .leading,
                               text: $viewModel.producedQuantity,
                               error: $viewModel.producedQuantityError)
            )
        case .availableQuantity:
            return AnyView(
                ErrorTextField(placeholder: Strings.availableQuantity,
                               alignment: .leading,
                               text: $viewModel.availableQuantity,
                               error: $viewModel.availableQuantityError)
            )
        case .productionYear:
            return AnyView(
                ErrorTextField(placeholder: Strings.productionYear,
                               alignment: .leading,
                               text: $viewModel.productionYear,
                               error: $viewModel.productionYearError)
            )
        case .productionMonth:
            return AnyView(
                ErrorTextField(placeholder: Strings.productionMonth,
                               alignment: .leading,
                               text: $viewModel.productionMonth,
                               error: $viewModel.productionMonthError)
            )
        }
    }
}

//struct CreateProductView_Previews: PreviewProvider {
//    @State var isPresented: Bool = true
//    
//    static var previews: some View {
//        CreateProductView(viewModel: CreateProductViewModel(), isPresented: $isPresented)
//    }
//}

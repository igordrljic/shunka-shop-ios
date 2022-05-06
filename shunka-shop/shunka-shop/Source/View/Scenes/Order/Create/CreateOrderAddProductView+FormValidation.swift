//
//  CreateOrderAddProductView+FormValidation.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25.4.22..
//

import Foundation

extension CreateOrderAddProductView.ViewModel
{
    enum ValidationError: LocalizedError
    {
        case productSelectionIsMandatory
        
        var errorDescription: String?
        {
            switch self
            {
            case .productSelectionIsMandatory:
                return Strings.CreateOrder.AddProduct.ValidationError.productIsMandatory
            }
        }
    }
    
    enum Validation
    {
        static func validate(product: Product?) throws -> Product
        {
            guard let product = product else
            {
                throw ValidationError.productSelectionIsMandatory
            }
            
            return product
        }
        
        static func validate(price: String?) throws -> Int
        {
            let priceString = try FormValidation.validateMandatory(value: price)
            let intValue = try FormValidation.validateInteger(value: priceString)
            return intValue
        }
        
        static func validate(quantity: String?) throws -> Float
        {
            let quantityString = try FormValidation.validateMandatory(value: quantity)
            let floatValue = try FormValidation.validateFloat(value: quantityString)
            return floatValue
        }
    }
}

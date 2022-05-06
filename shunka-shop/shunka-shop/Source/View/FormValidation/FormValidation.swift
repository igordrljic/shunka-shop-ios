//
//  FormValidation.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25.4.22..
//

import Foundation

enum FormValidationError: Error
{
    case mandatoryField
    case mustBeIntegerValue
    case mustBeDecimalValue
    case mustBeGreaterThenZero
}

extension FormValidationError: LocalizedError
{
    var errorDescription: String?
    {
        switch self
        {
        case .mandatoryField:
            return Strings.FormValidation.mandatoryField
        case .mustBeIntegerValue:
            return Strings.FormValidation.mustBeIntegerValue
        case .mustBeDecimalValue:
            return Strings.FormValidation.mustBeDecimalValue
        case .mustBeGreaterThenZero:
            return Strings.FormValidation.mustBeGreaterThenZero
        }
    }
}

enum FormValidation
{
    static func validateMandatory(value: String?) throws -> String
    {
        guard let value = value else
        {
            throw FormValidationError.mandatoryField
        }
        
        return value
    }
    
    static func validateInteger(value: String) throws -> Int
    {
        guard let value = Int(value) else
        {
            throw FormValidationError.mustBeIntegerValue
        }
        
        return value
    }
    
    static func validateFloat(value: String) throws -> Float
    {
        guard let value = Float(value) else
        {
            throw FormValidationError.mustBeDecimalValue
        }
        
        return value
    }
}

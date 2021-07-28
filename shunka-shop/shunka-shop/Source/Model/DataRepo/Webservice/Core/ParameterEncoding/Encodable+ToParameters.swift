//
//  Encodable+ToParameters.swift
//  shunka-shop
//
//  Created by Igor Drljic on 28.7.21..
//

import Foundation

enum SerializationError: LocalizedError {
    case jsonSerialization(error: Error)
    case castingSerializationResultToParametersFailed(data: Data)
    
    var errorDescription: String? {
        switch self {
        case .jsonSerialization:
            return "JSON serialization failed."
        case .castingSerializationResultToParametersFailed:
            return "Casting serialization result to Parameters failed."
        }
    }
}

extension Encodable {
    func toParameters() throws -> Parameters {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters else {
                throw SerializationError.castingSerializationResultToParametersFailed(data: data)
            }
            return dictionary
        } catch let error {
            throw SerializationError.jsonSerialization(error: error)
        }
    }
}

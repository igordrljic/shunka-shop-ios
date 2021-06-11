//
//  JSONDecoding.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

class JSONDecoding: ResponseDecoding {
    private let jsonDecoder = JSONDecoder()
    
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType {
        return try jsonDecoder.decode(ResultType.self, from: data)
    }
}

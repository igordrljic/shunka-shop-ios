//
//  JSONDecoding.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

class JSONDecoding: ResponseDecoding {
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType {
        return try JSONDecoder().decode(ResultType.self, from: data)
    }
}

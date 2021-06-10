//
//  ResponseDecoding.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

protocol ResponseDecoding {
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType
}

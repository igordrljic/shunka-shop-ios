//
//  JSONDecoding.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

private extension Date {
    static let defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        return dateFormatter
    }()
}

class JSONDecoding: ResponseDecoding {
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        jsonDecoder.dateDecodingStrategy = .formatted(Date.defaultDateFormatter)
    }
    
    func decode<ResultType: Decodable>(_ data: Data) throws -> ResultType {
        return try jsonDecoder.decode(ResultType.self, from: data)
    }
}

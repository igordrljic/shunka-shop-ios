//
//  AmountFormatterTests.swift
//  shunka-shopTests
//
//  Created by Igor Drljic on 15.2.22..
//

import XCTest
@testable import shunka_shop

class AmountFormatterTests: XCTestCase {
    
    func testAmountFormatter() {
        XCTAssertEqual(AmountFormatter.format(0),       "0 RSD")
        XCTAssertEqual(AmountFormatter.format(0.0),     "0 RSD")
        XCTAssertEqual(AmountFormatter.format(1),       "1 RSD")
        XCTAssertEqual(AmountFormatter.format(1.1),     "1,1 RSD")
        XCTAssertEqual(AmountFormatter.format(1.11),    "1,11 RSD")
        XCTAssertEqual(AmountFormatter.format(11.11),   "11,11 RSD")
        XCTAssertEqual(AmountFormatter.format(99.99),   "99,99 RSD")
    }
    
}

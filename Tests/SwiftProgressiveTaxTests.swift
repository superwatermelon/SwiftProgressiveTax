//
//  SwiftProgressiveTaxTests.swift
//  SwiftProgressiveTaxTests
//
//  Created by Stuart Wakefield on 01/03/2016.
//
//

import XCTest
@testable import SwiftProgressiveTax

class SwiftProgressiveTaxTests: XCTestCase {

    let tax = SwiftProgressiveTax([
        SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 125000), NSDecimalNumber.zero)!,
        SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 125000), NSDecimalNumber(string: "0.02"))!,
        SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 675000), NSDecimalNumber(string: "0.05"))!,
        SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 575000), NSDecimalNumber(string: "0.1"))!
    ], NSDecimalNumber(string: "0.12"))!
    
    func testProgressiveTaxCalculations() {

        XCTAssertEqual(tax * NSDecimalNumber(integerLiteral: 100000), NSDecimalNumber.zero)
        XCTAssertEqual(tax * NSDecimalNumber(integerLiteral: 500000), NSDecimalNumber(integerLiteral: 15000))
        XCTAssertEqual(tax * NSDecimalNumber(integerLiteral: 750000), NSDecimalNumber(integerLiteral: 27500))
        XCTAssertEqual(tax * NSDecimalNumber(integerLiteral: 2000000), NSDecimalNumber(integerLiteral: 153750))

    }
    
    func testInvalidProgressiveTax() {

        XCTAssertNil(SwiftProgressiveTax([], NSDecimalNumber(string: "invalid")))
        
    }
    
}

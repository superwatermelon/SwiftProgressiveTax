//
// Created by Stuart Wakefield on 02/03/2016.
//

import Foundation
import SwiftDecimalNumber

public class SwiftProgressiveTax {

    let zero = NSDecimalNumber.zero()
    public let brackets: [SwiftProgressiveTaxBracket]
    public let remaining: NSDecimalNumber

    public init() {
        self.brackets = []
        self.remaining = NSDecimalNumber.zero()
    }
    
    public init?(_ brackets: [SwiftProgressiveTaxBracket], _ remaining: NSDecimalNumber) {
        
        self.brackets = brackets
        self.remaining = remaining
        
        if (self.remaining == NSDecimalNumber.notANumber()) {
            return nil
        }
        
    }

    public func bands() -> [NSDecimalNumber] {
        return brackets.map { (bracket) in return bracket.band }
    }

    public func rates() -> [NSDecimalNumber] {
        return brackets.map { (bracket) in return bracket.rate } + [remaining]
    }

    public func banded(amount: NSDecimalNumber) -> [NSDecimalNumber] {
        
        return bands().reduce([amount]) { (result, band) in
            
            let last = result.last!
            let current = min(last, band)
            let remaining = max(zero, last - current)
            let initial = Array(result[0..<result.count - 1])
            let result = initial + [current] + [remaining]
            
            return result
            
        }
        
    }

    public func on(amount: NSDecimalNumber) -> NSDecimalNumber {
        return Array(zip(banded(amount), rates())).reduce(zero) { (result, pair) in return result + pair.0 * pair.1 }
    }

}

public class SwiftProgressiveTaxBracket {
    
    let band: NSDecimalNumber
    let rate: NSDecimalNumber
    
    public init() {
        self.band = NSDecimalNumber.zero()
        self.rate = NSDecimalNumber.zero()
    }
    
    public init?(_ band: NSDecimalNumber, _ rate: NSDecimalNumber) {
        
        self.band = band
        self.rate = rate
        
        if (NSDecimalNumber.notANumber() == self.band || NSDecimalNumber.notANumber() == self.rate) {
            return nil
        }
        
    }
    
}

func *(left: SwiftProgressiveTax, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.on(right)
}

func *(left: NSDecimalNumber, right: SwiftProgressiveTax) -> NSDecimalNumber {
    return right * left
}
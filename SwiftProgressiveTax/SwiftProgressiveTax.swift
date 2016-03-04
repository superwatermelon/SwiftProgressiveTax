//
// Created by Stuart Wakefield on 02/03/2016.
//

import Foundation
import SwiftDecimalNumber

class ProgressiveTax {

    let zero = NSDecimalNumber.zero()
    var brackets: [TaxBracket]
    var remaining: NSDecimalNumber

    init() {
        self.brackets = []
        self.remaining = NSDecimalNumber.zero()
    }
    
    init?(_ brackets: [TaxBracket], _ remaining: NSDecimalNumber) {
        
        self.brackets = brackets
        self.remaining = remaining
        
        if (self.remaining == NSDecimalNumber.notANumber()) {
            return nil
        }
        
    }

    func bands() -> [NSDecimalNumber] {
        return brackets.map { (bracket) in return bracket.band }
    }

    func rates() -> [NSDecimalNumber] {
        return brackets.map { (bracket) in return bracket.rate } + [remaining]
    }

    func banded(amount: NSDecimalNumber) -> [NSDecimalNumber] {
        
        return bands().reduce([amount]) { (result, band) in
            
            let last = result.last!
            let current = min(last, band)
            let remaining = max(zero, last - current)
            let initial = Array(result[0..<result.count - 1])
            let result = initial + [current] + [remaining]
            
            return result
            
        }
        
    }

    func on(amount: NSDecimalNumber) -> NSDecimalNumber {
        return Array(zip(banded(amount), rates())).reduce(zero) { (result, pair) in return result + pair.0 * pair.1 }
    }

}

class TaxBracket {
    
    let band: NSDecimalNumber
    let rate: NSDecimalNumber
    
    init() {
        self.band = NSDecimalNumber.zero()
        self.rate = NSDecimalNumber.zero()
    }
    
    init?(_ band: NSDecimalNumber, _ rate: NSDecimalNumber) {
        
        self.band = band
        self.rate = rate
        
        if (NSDecimalNumber.notANumber() == self.band || NSDecimalNumber.notANumber() == self.rate) {
            return nil
        }
        
    }
    
}

func *(left: ProgressiveTax, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.on(right)
}

func *(left: NSDecimalNumber, right: ProgressiveTax) -> NSDecimalNumber {
    return right * left
}
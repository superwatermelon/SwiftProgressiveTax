# SwiftProgressiveTax

A Swift library used to calculate progressive tax rates such as
income tax and stamp duty, for example:

```swift
let tax = SwiftProgressiveTax([
    SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 125000), NSDecimalNumber.zero())!,
    SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 125000), NSDecimalNumber(string: "0.02"))!,
    SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 675000), NSDecimalNumber(string: "0.05"))!,
    SwiftProgressiveTaxBracket(NSDecimalNumber(integerLiteral: 575000), NSDecimalNumber(string: "0.1"))!
], NSDecimalNumber(string: "0.12"))

let amount = tax * NSDecimalNumber(integerLiteral: 500000) // NSDecimalNumber(integerLiteral: 15000)
```

## Installation

To install to use within your project use Cocoapods and add the
following to your Podfile:

```
pod 'SwiftProgressiveTax', '~> 0.1.1'
```

## API

### `SwiftProgressiveTax([SwiftProgressiveTaxBand, ...], NSDecimalNumber)`

The first argument is an array of bands ordered sequentially,
the first band in the array will be processed first. The last
argument is the rate to apply to everything that falls outside
of the bands.

### `SwiftProgressiveTaxBand(NSDecimalNumber, NSDecimalNumber)`

The first argument is the size of the band, each band is filled
sequentially. The second argument is the rate for the band, the
amount that falls into the band will be multiplied by this rate.
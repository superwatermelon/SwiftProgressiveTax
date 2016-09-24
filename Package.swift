import PackageDescription

let package = Package(
    name: "SwiftProgressiveTax",
    dependencies: [
      .Package(
        url: "https://github.com/superwatermelon/SwiftDecimalNumber.git",
        Version(1,0,3)
      )
    ]
)

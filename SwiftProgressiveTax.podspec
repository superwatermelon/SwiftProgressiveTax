Pod::Spec.new do |s|

  s.name = "SwiftProgressiveTax"

  s.version = "1.0.1"

  s.summary = "Library for calculations for progressive tax."

  s.description = <<-DESC
  A library providing an API to calculate progressive tax.
  Used to perform tax calculations for things like income
  tax and SDLT.
  DESC

  s.homepage = "https://github.com/superwatermelon/SwiftProgressiveTax"

  s.license = 'MIT'

  s.author = { "Stuart Wakefield" => "stuart@superwatermelon.com" }

  s.source = {
    :git => "https://github.com/superwatermelon/SwiftProgressiveTax.git",
    :tag => s.version.to_s
  }

  s.platform = :ios, '9.2'

  s.source_files = 'Sources/**/*.swift'

  s.dependency 'SwiftDecimalNumber', '~> 1.0.3'

end

#
# Be sure to run `pod lib lint BoltsHelpers.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BoltsHelpers"
  s.version          = "0.1.1"
  s.summary          = "A collection of classes and categories to extend foundation and UIKit frameworks with Bolts."
  s.description      = <<-DESC
                       A collection of classes and categories to extend foundation and UIKit frameworks with Bolts.
                       
                       The current version of this library is a bit bare-bones, but contains categories on UIImage and NSData to put some potentially expensive operations on a background queue and return a BFTask to handle the result.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/nickhart/BoltsHelpers"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Nicholas Hart" => "nickhart@gmail.com" }
  s.source           = { :git => "https://github.com/nickhart/BoltsHelpers.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/seanickhart'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}'
  # s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Bolts', '~> 1.1.1'
end

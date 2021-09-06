#
#  Be sure to run `pod spec lint URLBuilder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = 'URLBuilder'
  spec.version      = '1.0.0'
  spec.summary      = 'A library to construct URLs with an elegant, SwiftUI-like syntax.'

  spec.homepage     = 'https://github.com/henrik-dmg/URLBuilder'

  spec.license      = 'MIT'

  spec.author = { 'Henrik Panhans' => 'henrik@panhans.dev' }
  spec.social_media_url = 'https://twitter.com/henrik_dmg'

  spec.source = { git: 'https://github.com/henrik-dmg/URLBuilder.git', tag: spec.version.to_s }
  spec.source_files = 'Sources/URLBuilder/**/*.swift'

  spec.requires_arc = true

  spec.ios.deployment_target = '9.0'
  spec.osx.deployment_target = '10.10'
  spec.watchos.deployment_target = '3.0'
  spec.tvos.deployment_target = '9.0'

  spec.swift_version = '5.5'

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
end

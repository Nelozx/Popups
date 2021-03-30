#
# Be sure to run `pod lib lint Popups.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Popups'
  s.version          = '0.0.1'
  s.summary          = 'Popup view'
  s.description      = <<-DESC
  Add description xx long description description of description the pod here.
                       DESC

  s.homepage         = 'https://github.com/Nelozx/Popups'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nelo' => 'nelozx@163.com' }
  s.source           = { :git => 'https://github.com/Nelozx/Popups.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version  = '5.0'

  s.source_files = 'Popups/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Popups' => ['Popups/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

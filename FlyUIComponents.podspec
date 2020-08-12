#
# Be sure to run `pod lib lint FlyUIComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlyUIComponents'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FlyUIComponents.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/niefeian/FlyUIComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '335074307@qq.com' => 'oncwnuOFQIPUqFMr48EisEyZQvmM@git.weixin.qq.com' }
  s.source           = { :git => 'https://github.com/niefeian/FlyUIComponents.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FlyUIComponents/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FlyUIComponents' => ['FlyUIComponents/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
        s.dependency 'NFAToolkit'
        s.dependency 'SnapKit', '~> 4.2.0'
        #    s.dependency 'SDWebImage', '~> 5.5.2'
        s.dependency 'SwiftProjects'
        s.dependency 'AutoModel'
        s.dependency 'ProThirdpart'

        s.swift_version = '5.0'
end

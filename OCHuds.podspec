#
# Be sure to run `pod lib lint OCHuds.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OCHuds'
  s.version          = '1.3.1'
  s.summary          = 'A bunch of huds.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A bunch of huds: Spinner, Progress, Message and Animated.
                       DESC

  s.homepage         = 'https://github.com/OpenCraft/OCHuds'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Henrique Morbin' => 'morbin_@hotmail.com' }
  s.source           = { :git => 'https://github.com/OpenCraft/OCHuds.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Morbin_'

  s.ios.deployment_target = '8.0'

  s.source_files = 'OCHuds/Classes/**/*'
  
  s.resource_bundles = {
    'OCHuds' => ['OCHuds/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
# s.dependency 'OCExtensions'
end

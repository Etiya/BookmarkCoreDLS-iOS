#
# Be sure to run `pod lib lint BookmarkCoreDLS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BookmarkCoreDLS'
  s.version          = '0.0.1'
  s.summary          = 'BookmarkCoreDLS is a private library for Etiya iOS team.'
  s.swift_version    = '4.2'
  s.requires_arc = true

  s.description      = <<-DESC
BookmarkCoreDLS is a library which contain all essential components for Bookmark Project.
                       DESC

  s.homepage         = 'https://gitlab.com/etiyaios/coredls'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'muratyilmaz' => 'muratylmz89@gmail.com' }
  s.source           = { :git => 'https://gitlab.com/etiyaios/coredls.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Etiya_Tr'

  s.ios.deployment_target = '10.0'
  s.platform = :ios, '10.0'

  s.source_files = 'BookmarkCoreDLS/Classes/**/*'
  
  s.resource_bundles = {
     'BookmarkCoreDLS' => ['BookmarkCoreDLS/Assets/*.ttf']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SnapKit'
end

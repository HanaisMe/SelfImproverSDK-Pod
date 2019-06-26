Pod::Spec.new do |s|
  s.name             = 'ShiggyKit'
  s.version          = '0.1.0'
  s.summary          = 'Utilities to save time when developing'
  s.homepage         = 'https://github.com/HanaisMe/ShiggyKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HanaIsMe' => 'hanaismelee@gmail.com' }
  s.source           = { :git => 'https://github.com/HanaIsMe/ShiggyKit-Pod.git', :tag => s.version.to_s }
  s.swift_version = '4.0'
  s.ios.deployment_target  = '11.0'
  s.social_media_url = 'https://twitter.com/jeongsik_lee'
  s.ios.deployment_target = '11.0'
  s.source_files = 'ShiggyKit/Classes/**/*.{swift}'
  s.frameworks = 'UIKit'
end

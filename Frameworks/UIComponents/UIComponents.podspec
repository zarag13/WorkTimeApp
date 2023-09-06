Pod::Spec.new do |s|
  s.name         = 'UIComponents'
  s.module_name  = 'UIComponents'
  s.version      = '0.1.0'
  s.summary      = 'A sample pod that depends on AuthApp'
  s.swift_version = '5.0'
  s.homepage     = 'https://github.com/Zarag13/UIComponents'
  s.license      = 'MCI'
  s.author       = { 'VP' => 'https://github.com/Zarag13/UIComponents' }
  s.platform     = :ios, '14.0'
  s.source       = { :git => 'https://github.com/Zarag13/UIComponents', :tag => '1.0.0' }
  s.ios.deployment_target = '14.0'

  s.source_files = '**/*.{swift,h,m,xib,storyboard}'
  s.resources = [
    "Resources/*.{strings,zcassets,stringsdict}",
    "Resources/**/*.{strings,stringsdict}"
  ]
  s.dependency 'SnapKit'
end
#
# Be sure to run `pod lib lint DYMobileMode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DYMobileMode'
  s.version          = '0.2.0'
  s.summary          = 'iphone device mode'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DonYau/DYMobileMode'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DonYau' => 'DonYau@126.com' }
  s.source           = { :git => 'https://github.com/DonYau/DYMobileMode.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'
  s.source_files = 'DYMobileMode/mobileMode/**/*'

end

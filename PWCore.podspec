Pod::Spec.new do |s|
  s.name         = "PWCore"
  s.version      = "3.11.0"
  s.summary      = "Phunware's Core SDK for use with its Multiscreen-as-a-Service platform. This is a required dependency for all Phunware SDKs."
  s.homepage     = "http://phunware.github.io/maas-core-ios-sdk/"
  s.author       = { 'Phunware, Inc.' => 'http://www.phunware.com' }
  s.social_media_url = 'https://twitter.com/Phunware'

  s.platform     = :ios, '10.0'
  s.source       = { :git => "https://github.com/phunware/maas-core-ios-sdk.git", :tag => "v#{s.version}" }
  s.license      = { :type => 'Copyright', :text => 'Copyright 2009-present Phunware Inc. All rights reserved.' }

  s.libraries 	 = 'z', 'xml2.2'
  s.ios.dependency 'AFNetworking/NSURLSession','~> 4.0'
  s.ios.dependency 'AFNetworking/Security', '~> 4.0'
  s.ios.dependency 'AFNetworking/Serialization', '~> 4.0'
  s.ios.dependency 'AFNetworking/Reachability', '~> 4.0'
  s.ios.dependency 'SSZipArchive', '~> 2.0'
  s.ios.dependency 'TMCache', '~> 2.0'
                                                                              
  s.ios.vendored_frameworks = 'Frameworks/PWCore.xcframework'
  s.ios.frameworks = 'Security', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony'
  s.requires_arc = true

  s.default_subspec = 'LimitedDeviceIdentity' 
 
  s.subspec 'LimitedDeviceIdentity' do |sub|
  end

  s.subspec 'DeviceIdentity' do |sub|
    sub.ios.vendored_frameworks = 'Frameworks/DeviceIdentity.xcframework'
    sub.ios.frameworks = 'AdSupport'
  end
end

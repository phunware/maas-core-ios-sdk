Pod::Spec.new do |spec|
  spec.name = 'PWCore'
  spec.version = '3.12.0-beta-03'
  spec.license = { :type => 'Copyright', :text => 'Copyright 2009-present Phunware Inc. All rights reserved.' }
  spec.summary = "Phunware's Core SDK for use with its Multiscreen-as-a-Service platform"
  spec.homepage = 'https://github.com/phunware/maas-core-ios-sdk'
  spec.author = { 'Phunware, Inc.' => 'https://www.phunware.com' }
  spec.social_media_url = 'https://twitter.com/phunware'

  spec.platform = :ios, '13.0'
  spec.source = { :git => "https://github.com/phunware/maas-core-ios-sdk.git", :tag => "v#{spec.version}" }
  spec.documentation_url = 'https://phunware.github.io/maas-core-ios-sdk/'

  spec.default_subspecs =
   'Core'

  spec.subspec 'Core' do |subspec|
    subspec.dependency 'AFNetworking/NSURLSession','~> 4.0.0'
    subspec.dependency 'AFNetworking/Reachability', '~> 4.0.0'
    subspec.dependency 'AFNetworking/Security', '~> 4.0.0'
    subspec.dependency 'AFNetworking/Serialization', '~> 4.0.0'
    subspec.dependency 'SSZipArchive', '~> 2.4.0'
    subspec.dependency 'TMCache', '~> 2.1.0'

    subspec.vendored_frameworks = 'Frameworks/PWCore.xcframework'

    subspec.frameworks =
      'CoreServices',
      'CoreTelephony',
      'QuartzCore',
      'Security',
      'SystemConfiguration'
      
    subspec.weak_frameworks = 'CoreLocation'
  
    subspec.libraries =
      'xml2.2',
      'z'
  end

  spec.subspec 'DeviceIdentity' do |subspec|
    subspec.dependency 'PWCore/Core'

    subspec.vendored_frameworks = 'Frameworks/DeviceIdentity.xcframework'

    subspec.frameworks = 'AdSupport'

    subspec.weak_frameworks = 'AppTrackingTransparency'
  end
end

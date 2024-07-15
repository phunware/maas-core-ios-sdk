Pod::Spec.new do |spec|
  spec.name = 'PWCore'
  spec.version = '3.13.0'
  spec.license = { :type => 'Copyright', :text => 'Copyright 2009-present Phunware Inc. All rights reserved.' }
  spec.summary = "Phunware's Core SDK for use with its Multiscreen-as-a-Service platform"
  spec.homepage = 'https://github.com/phunware/maas-core-ios-sdk'
  spec.author = { 'Phunware, Inc.' => 'https://www.phunware.com' }
  spec.social_media_url = 'https://twitter.com/phunware'

  spec.platform = :ios, '15.5'
  spec.source = { :git => 'https://github.com/phunware/maas-core-ios-sdk.git', :tag => "#{spec.version}" }
  spec.documentation_url = 'https://phunware.github.io/maas-core-ios-sdk/'
  spec.cocoapods_version = '>= 1.12.0'

  spec.default_subspecs =
   'Core'

  spec.subspec 'Core' do |subspec|
    subspec.dependency 'SSZipArchive', '~> 2.5.5'
    subspec.dependency 'PINCache', '~> 3.0.4'

    subspec.vendored_frameworks = 'Frameworks/PWCore.xcframework'

    subspec.frameworks =
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

  spec.subspec 'CoreStaticLinks' do |subspec|
    subspec.vendored_frameworks = 'FrameworksStaticLinks/PWCore.xcframework'
  end

  spec.subspec 'DeviceIdentityStaticLinks' do |subspec|
    subspec.dependency 'PWCore/CoreStaticLinks'

    subspec.vendored_frameworks = 'FrameworksStaticLinks/DeviceIdentity.xcframework'

    subspec.frameworks = 'AdSupport'

    subspec.weak_frameworks = 'AppTrackingTransparency'
  end
end

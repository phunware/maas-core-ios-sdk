PWCore SDK for iOS
================
[![Version](https://img.shields.io/cocoapods/v/PWCore.svg?style=flat-square)](https://cocoapods.org/pods/PWCore) [![License](https://img.shields.io/cocoapods/l/PWCore.svg?style=flat-square)](https://cocoapods.org/pods/PWCore) [![Platforms](https://img.shields.io/cocoapods/p/PWCore?style=flat-square)](https://cocoapods.org/pods/PWCore) [![Twitter](https://img.shields.io/badge/twitter-@phunware-blue.svg?style=flat-square)](https://twitter.com/phunware)

This is Phunware's Core SDK for use with its Multiscreen-as-a-Service platform. Visit http://maas.phunware.com for more details and to sign up.

**NOTE**: This is a required dependency for all Phunware SDKs.

Requirements
------------
- iOS 15.5 or greater
- Xcode 15 or greater

Installation
------------
### CocoaPods
It is required to use [CocoaPods](http://www.cocoapods.org) 1.12 or greater to integrate the framework. Simply add the following to your Podfile:

````ruby
pod 'PWCore'
````

To enable support for requesting authorization to access the identifier for advertisers (IDFA), add the `DeviceIdentity` subspec:

````ruby
pod 'PWCore/DeviceIdentity'
````

Documentation
------------
Documentation is included in the Documents folder in the repository as both HTML and as a .docset. You can also find the latest documentation here: http://phunware.github.io/maas-core-ios-sdk

Integration
-----------
Import PWCore at the top of your application's delegate:

````swift
import PWCore
````

Initialize PWCore in your application delegate's [application(_:didFinishLaunchingWithOptions:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application) method:

````swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // These values can be found for your application in the MaaS portal at http://maas.phunware.com/clients.    
    PWCore.setApplicationID("APPLICATION_ID",
                            accessKey: "ACCESS_KEY")

    ...
}
````

Location Permissions
--------------------
Location authorization of "When In Use" or "Always" is encouraged when starting PWCore for analytics purposes. Please follow [Apple's Best Practices](https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services) for requesting location permissions.

Identifier for Advertisers (IDFA) Permission 
--------------------------------------------
Starting with iOS 14.5, accessing the identifier for advertisers (IDFA) requires authorization through Apple's [AppTrackingTransparency framework](https://developer.apple.com/documentation/apptrackingtransparency). Authorization is encouraged when starting PWCore, and can be requested directly through the SDK: 

````swift
import PWCore
import DeviceIdentity

...

switch PWCore.isAdvertisingIdentifierPermissionRequestable {
case .allowed:
    PWCore.requestAdvertisingIdentifierPermission { (advertisingIdentifier) in
        // Advertising identifier available
        print("Advertising Identifier: \(advertisingIdentifier)")
    } failure: { (error) in
        // Advertising identifier not available
        print(error)
    }
case .notAllowed:
    // Authorization is either restricted or has been previously denied
    print("Advertising identifier cannot be requested.")
case .alreadyAuthorized:
    // Advertising identifier is already available
    print("Advertising Identifier: \(PWCore.deviceID())")
}
````

Attribution
-----------
PWCore uses the following third-party dependencies:

<table>
  <tr>
  <th style="text-align:center;">Component</th>
  <th style="text-align:center;">Description</th>
  <th style="text-align:center;">License</th>
  </tr>
  <tr>
    <td><a href="https://github.com/pinterest/PINCache">PINCache</a></td>
    <td>
     Fast, non-deadlocking parallel object cache for iOS, tvOS and OS X.
    </td>
    <td style="text-align:center;""><a href="https://github.com/pinterest/PINCache/blob/master/LICENSE.txt">Apache 2.0</a>
    </td>
  </tr>
  <tr>
    <td><a href="https://github.com/ZipArchive/ZipArchive">SSZipArchive</a></td>
    <td>
     Zipping and unzipping files for iOS and OS X.
    </td>
    <td style="text-align:center;""><a href="https://github.com/ZipArchive/ZipArchive/blob/master/LICENSE.txt">MIT</a>
    </td>
  </tr>
</table>

Privacy
-----------
You understand and consent to Phunware’s Privacy Policy located at www.phunware.com/privacy. If your use of Phunware’s software requires a Privacy Policy of your own, you also agree to include the terms of Phunware’s Privacy Policy in your Privacy Policy to your end users.

Terms
-----------
Use of this software requires review and acceptance of our terms and conditions for developer use located at http://www.phunware.com/terms

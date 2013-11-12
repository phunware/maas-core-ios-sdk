MaaSCore iOS SDK
================

Version 1.2.1

This is the iOS SDK for the MaaSCore module. Visit http://maas.phunware.com/ for more details and to sign up.



Requirements
------------

- iOS 5.0 or greater
- Xcode 4.4 or greater



Installation
------------

MaaSCore is a required dependency for all MaaS modules.

It's recommended that you add MaaSCore.framework to the 'Vendor/Phunware' directory. Then add the MaaSCore.framework to your Xcode project.

The following frameworks are required:
````
SystemConfiguration.framework
MobileCoreServices.framework
QuartzCore.framework
CoreTelephony.framework
Security.framework
AdSupport.framework
````

**NOTE**: If you are supporting < iOS 6.0 you will need to weak-link *AdSupport.framework*.


The following frameworks are optional:
````
CoreLocation.framework
````
**NOTE**: CoreLocation is used for comprehensive analytics. Apple mandates that your app have a good reason for enabling location services. Apple will deny your app if location is not a core feature for your app.

After specifying the frameworks you will need to add a linker flag to your build target. 1. Navigate to your build target.
2. Navigate to the Build Settings tab.
3. Find the Linking Section -> Other Linker Flags
4. Add "-ObjC" to Other Linker Flags

You can now proceed with installation of additional MaaS modules.



Documentation
------------

MaaSCore documentation is included in the Documents folder in the repository as both HTML and .docset. You can also find the latest documentation here: http://phunware.github.io/maas-core-ios-sdk/



Application Setup
-----------------
At the top of your application delegate implementation (.m) file add the following:

````objective-c
#import <MaaSCore/MaaSCore.h>
````

Inside your application delegate you will need to initialize MaaSCore in the application:didFinishLaunchingWithOptions: method:

````objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// These values can be found for your application in the MaaS Portal (http://maas.phunware.com/clients)
    [MaaSCore setApplicationID:@"APPLICATION_ID"
    			   setAccessKey:@"ACCESS_KEY"
                  signatureKey:@"SIGNATURE_KEY"
                 encryptionKey:@"ENCRYPT_KEY"]; // Currently unused. You can place any NSString value here
                  
    // OPTIONAL: If you want to enable logging in MaaSCore, call the following
    [MaaSCore setLoggingLevel:MaaSLogLevel_Debug forService:[MaaSCore serviceName]];
    ...
}
````



Attribution
-----------
MaaSCore uses the following 3rd party components. All components are prefixed so you won't have to worry about namespace collisions.

<table>
  <tr>
  <th style="text-align:center;">Component</th>
  <th style="text-align:center;">Description</th>
  <th style="text-align:center;">License</th>
  </tr>
  <tr>
    <td><a href="https://github.com/AFNetworking/AFNetworking">AFNetworking</a></td>
    <td>
     A delightful iOS and OS X networking framework
    </td>
    <td style="text-align:center;""><a href="https://github.com/AFNetworking/AFNetworking/blob/master/LICENSE">MIT</a>
    </td>
  </tr>
  <tr>
    <td><a href="https://github.com/rnapier/RNCryptor">RNCryptor</a></td>
    <td>
     CCCryptor (AES encryption) wrappers for iOS and Mac.
    </td>
    <td style="text-align:center;""><a href="https://github.com/rnapier/RNCryptor/blob/master/README.md">MIT</a>
    </td>
  </tr>
  <tr>
    <td><a href="https://github.com/nicklockwood/NSOperationStack">NSOperationStack</a></td>
    <td>
     A LIFO (Last-In, First-Out) queuing extension for NSOperationQueue
    </td>
    <td style="text-align:center;""><a href="https://github.com/nicklockwood/NSOperationStack/blob/master/LICENCE.md">MIT</a>
    </td>
  </tr>
  <tr>
    <td><a href="https://github.com/tumblr/TMCache">TMCache</a></td>
    <td>
     Fast parallel object cache for iOS and OS X
    </td>
    <td style="text-align:center;""><a href="https://github.com/tumblr/TMCache/blob/master/LICENSE.txt">Apache 2.0</a>
    </td>
  </tr>
</table>

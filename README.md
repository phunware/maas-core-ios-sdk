MaaSCore iOS SDK
================

Version 1.0.0

This is the iOS SDK for the Phunwares Alerts & Notifications MaaS module. Visit http://www.phunware.com/ for more details and to sign up.


Installation
------------

MaaSCore is a required depedency for all MaaS modules.

It's recommended that you add MaaSCore.framework to a 'MaaS Frameworks' directory. Then add the MaaSCore.framework to your Xcode project.

The following frameworks are required:
````
SystemConfiguration.framework
MobileCoreServices.framework
QuartzCore.framework
CoreTelephony.framework
Security.framework
````

The following frameworks are optional:
````
CoreLocation.framework
````
NOTE: CoreLocation is used for comprehensive analytics. Apple mandates that your app have a good reason for enabling Location services. Apple will deny your app if location is not a core feature for your app.

You can now proceed with installation of additional MaaS modules.


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
	// These values can be found for your application in MaaS Portal
    [MaaSCore setAccessKey:@"YOUR_ACCESS_KEY"
              signatureKey:@"YOUR_SIGNATURE_KEY"
             encryptionKey:@"YOUR_SIGNATURE_KEY"];
                  
    // If you want to enable logging in MaaSCore, call the following
    [MaaSCore setLoggingLevel:MaaSLogLevel_Debug forService:[MaaSCore serviceName]];
    ...
}
````


Attribution
-----------
MaaSCore uses the following 3rd party components. All components are prefixed so you won't have to worry about name space collisions.

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
</table>

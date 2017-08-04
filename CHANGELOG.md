#PWCore Changelog
##3.1.1 (Friday, August 4th, 2017)
* Changed build process to reduce the final size of integrated framework.
* Changed info.plist to allow iPhoneOS archiving with bitcode.

##3.1.0 (Friday, Jun 30th, 2017)
* PWCore now includes CME and Analytics components without the need for seperate PWCME and PWAnalytics SDK's
 - **NOTE**: This version of PWCore cannot work with PWCME and PWAnalytics. Instead import `#import <PWCore/PWCore.h>`.

* Added AFNetworking and TMCache as external dependencies.

##3.0.4 (Tuesday, March 28th, 2017)
* Bug fix: the cached bundle will be used when network is unavailable.
* Support bitcode

##3.0.3 (Friday, Jan 27th, 2017)
* Add PWAPIManager.h and PWBundleManager.h
* PWAPIManager.h - Providing convenient methods make it easier to make MaaS API calls.
* PWBundleManager.h - It's using for handling bundle downloading, supports decryption, unzip, manifest validation and Etag check, etc.


##3.0.2 (Tuesday, Oct 18th, 2016)
* Internal SDK Enhancements.

##3.0.1 (Tuesday, Sep 6th, 2016)
* Updated analytics payloads.

##3.0.0 (Monday, July 25th, 2016)
* Add current location of end user in anlytics request payload.
* Bug fixes for make app crashes sometimes

##2.0.0 (Friday, September 25th, 2015)
* Renamed SDK to `PWCore`. Old `MaaSCore` interfaces are preserved but deprecated.
* Enabled the ability to dynamically re-register with `PWCore` instead of having to restart the application.
* Fixed potential crash issue with the standard analytics payload.
* Updated standard analytics payload to include additional information.
* Updated internal networking interfaces, optimizing for performance and battery life.

##1.3.2 (Wednesday, January 7th, 2015)
 * Fixed a bug where fetching the users location
 * Fixing issue where internal location fetch callback wasn't being trigger when location services were enabled. Currently the only applications which would be affected are those using the `PWAlerts` SDK *AND* have location services enabled.
 * MaaSCore no longer requests permission for location services and will now only fetch the device location if it's readily available.
 * Deprecating `disableLocationServices` method since it's no longer relevant.

##1.3.1 (Monday, October 17th, 2014)
 * Fixed issue with encryption not working for PWAlerts SDK

##1.3.0 (Monday, October 6th, 2014)
 * Added support for API encryption
 * Bug fixes and optimizations

##1.2.7 (Monday, April 21st, 2014)
 * Removed dependency on AdSupport.framework

##1.2.6 (Wednesday, March 26th, 2014)
 * Adding arm64 support

##1.2.4 (Tuesday, January 27th, 2014)
 * Improved location based services integration

##1.2.2 (Tuesday, January 7th, 2014)
 * Fixed issue where the session timestamp was being improperly recorded

##1.2.1 (Tuesday, November 12th, 2013)
 * Fixed potential threading issue with accessing standard date formatter

##1.2.0 (Friday, October 18th, 2013)
 * Added support for location based services
 * Added check for AdSupport.framework

##1.0.1 (Thursday, August 8th, 2013)
 * Fixed issue where internal aggregate analytic events were not being cached properly

##1.0.0 (Friday, June 30th, 2013)
 * Initial release

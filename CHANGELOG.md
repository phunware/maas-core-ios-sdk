# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.13.1][] - 2025-07-22

### Changed

- Increased timeout for network requests to 30 seconds

### Fixed

- Fixed inaccurate Sessions count

## [3.13.0][] - 2024-07-12

### Added

- Added privacy manifests

### Changed

- Bumped minimum iOS deployment target to 15.5
- Improved nullability annotations

## [3.12.2][] - 2023-08-30

### Fixed

- Fixed an issue where an API request would fail after successfully refreshing an expired authorization header.
- Fixed an issue where an API request made through `PWAPIManager` would sometimes fail to return execution back to the caller.

## [3.12.1][] - 2022-05-24

### Fixed
  
- Fixed authentication header for the ME event retry. 

## [3.12.0][] - 2022-03-03

### Added

- Added Swift Package Manager support.

### Changed

- Allowed bundle fetch caller to handle missing file.
- Processed bundle files in background thread.

### Removed

- Removed the dependency on MaaS App's signature key.
- Removed all deprecated API.

## [3.11.0][] - 2021-07-28

### Changed

- Changed IDFA handling for iOS 14+.
- Bumped minimum iOS deployment target to 13.0

## [3.10.0][] - 2021-03-15

### Added

* Added support for campus routing
* Added IDFA authorization request for iOS 14.5+

## [3.9.1][] - 2020-11-05

### Changed

- Updated IDFA handling for iOS 14+.
- Built and archived SDK with Xcode 12.

## [3.9.0][] - 2020-09-03

### Added

- Exposed API to control whether or not the SDK can request location updates
- Migrated to use XCFrameworks

## [3.8.9][] - 2020-06-05

### Added

- Exposed manual screen view event tracking API.

### Removed

- Removed some location information from events.

## [3.8.8][] - 2020-01-03

### Fixed

- Fixed the 'bluetoothEnabled' value in the analytics payload to always be a boolean in order to pass server validation.

## [3.8.7][] - 2019-12-18

### Removed

- Removed the bluetoothEnabled check from standard analytics payload. Now the value in the payload with key "bluetoothEnabled" will always return false.

## [3.8.6] - 2019-09-25

### Removed

- Removed AFNetworking's UIKit subspec in order to not have any Webview code coming from AFNetworking dependency. Core now uses the following AFNetworking subspecs: NSURLSession, Security, Serialization, and Reachability.
- Removed deprecated UIWebview code from within Core. Replaced with WKWebview.

## [3.8.5][] - 2019-08-23

### Removed

- Removed useIDFA flag and replaced with compiler flag, FORCE_IDFV. Based on how the build is performed, this flag is on or off and controls whether the AdSupport framework and IDFA is used.

## [3.8.4][] - 2019-08-13

### Added

- Added useIDFA flag

## [3.8.3][] - 2019-04-02

### Fixed

- Fixed analytics payload

## [3.8.2][] - 2019-02-20

### Changed

- Switched to new v3.0 Map-API

## [3.8.1][] - 2018-12-03

### Fixed

- Fixed analytic screen view events for stacked views

## [3.8.0][] - 2018-12-14

### Added

- Added new automatic screen view analytic events

### Changed

- Simplified custom event analytics API

### Fixed

- Fixed session start when switching application ids

## [3.7.0][] - 2018-08-13

### Changed

- Bumped minimum iOS deployment target to 10.0

### Removed

- Removed old module registration code and move new registration to after new session generation

## [3.6.0][] - 2018-05-31

### Fixed

- Fixed CME content completion block types
- Fixed missing session id during SDK registration

## [3.5.0][] - 2018-05-07

### Removed

- Removed location permission prompting

### Fixed

- Fixed SESSION analytics

## [3.4.1][] - 2018-04-25

### Added

- Added configurable bundle cache timeout

### Fixed

- Fixed crash on bundle network request failure

## [3.4.0][] - 2018-04-16

### Added

- Added userInfo object to completion block of fetchBundleWithURL: and fetchBuildingBundleById: to provide additional information when using cached bundle

### Changed

- Moved location analytic payload to device level

### Fixed

- Fixed issue where log level not honored when set before creation of PWLogger

## [3.3.1][] - 2018-02-22

### Fixed

- Fixed issue with initial network requests using JWT

## [3.3.0][] - 2018-02-22

### Changed

- Updated Mapping API calls to use JWT
- Reduced bundle cache timeout to fall back to cached bundles faster

## [3.1.3][] - 2017-10-19

### Fixed

- Fixed thread deadlocking issue

## [3.1.2][] - 2017-10-25

### Added

- Added PWLogger

### Changed

- Changed location permissions to requestAlwaysAuthorization

### Fixed

- Fixed analytics call made on wrong thread

## [3.1.1][] - 2017-08-04

### Changed

- Changed build process to reduce the final size of integrated framework.
- Changed info.plist to allow iPhoneOS archiving with bitcode.

## [3.1.0][] - 2017-06-30

### Added

- Added AFNetworking and TMCache as external dependencies.

### Changed

- PWCore now includes CME and Analytics components without the need for seperate PWCME and PWAnalytics SDK's. **NOTE**: This version of PWCore cannot work with PWCME and PWAnalytics. Instead import `#import <PWCore/PWCore.h>`.

## [3.0.4][] - 2017-03-28

### Added

- Added support for bitcode

### Fixed

- Fixed an issue where the cached bundle was not used when network is unavailable.

## [3.0.3][] - 2017-01-27

### Added

- Added PWAPIManager to provide convenient methods make it easier to make MaaS API calls.
- Added PWBundleManager to manage bundle downloading, decryption, unzipping, manifest validation, Etag validation, etc.

## [3.0.2][] - 2016-10-18

### Changed

- Changed internal components.

## [3.0.1][] - 2016-09-06

### Changed

- Updated analytics payloads.

## [3.0.0][] - 2016-07-25

### Added

- Added current location of end user in anlytics request payload.

### Fixed

- Fixed crashes.

## 2.0.0 - 2015-09-25

### Added

- Added the ability to dynamically re-register with `PWCore` instead of having to restart the application.

### Changed

- Renamed SDK to `PWCore`. Old `MaaSCore` interfaces are preserved but deprecated.
- Updated standard analytics payload to include additional information.
- Updated internal networking interfaces, optimizing for performance and battery life.

### Fixed

- Fixed potential crash issue with the standard analytics payload.

## 1.3.2 - 2015-01-07

### Fixed

- Fixed a bug where fetching the users location
- Fixed issue where internal location fetch callback wasn't being trigger when location services were enabled. Currently the only applications which would be affected are those using the `PWAlerts` SDK *AND* have location services enabled.

### Changed

- MaaSCore no longer requests permission for location services and will now only fetch the device location if it's readily available.

### Deprecated

- Deprecated `disableLocationServices` method since it's no longer relevant.

## 1.3.1 - 2014-10-17

### Fixed

- Fixed issue with encryption not working for PWAlerts SDK

## 1.3.0 - 2014-10-06

### Added

- Added support for API encryption

### Fixed

- Fixed several bugs

## 1.2.7 - 2014-04-21

### Removed

- Removed dependency on AdSupport.framework

## 1.2.6 - 2014-03-26

### Added

- Added arm64 support

## 1.2.4 - 2014-01-27

### Changed

- Improved location based services integration

## 1.2.2 - 2014-01-07

### Fixed

- Fixed issue where the session timestamp was being improperly recorded

## 1.2.1 - 2014-11-12

### Fixed

- Fixed potential threading issue with accessing standard date formatter

## 1.2.0 - 2013-10-18

### Added

- Added support for location based services
- Added check for AdSupport.framework

## 1.0.1 - 2014-08-08

### Fixed

- Fixed issue where internal aggregate analytic events were not being cached properly

## 1.0.0 - 2013-06-30

### Added

- Initial release

[3.13.1]: https://github.com/phunware/maas-core-ios-sdk/compare/3.13.0...3.13.1
[3.13.0]: https://github.com/phunware/maas-core-ios-sdk/compare/3.12.2...3.13.0
[3.12.2]: https://github.com/phunware/maas-core-ios-sdk/compare/3.12.1...3.12.2
[3.12.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.12.0...3.12.1
[3.12.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.11.0...v3.12.0
[3.11.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.10.0...v3.11.0
[3.10.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.9.1...v3.10.0
[3.9.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.9.0...v3.9.1
[3.9.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.9...v3.9.0
[3.8.9]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.8...v3.8.9
[3.8.8]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.7...v3.8.8
[3.8.7]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.6...v3.8.7
[3.8.6]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.5...v3.8.6
[3.8.5]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.4...v3.8.5
[3.8.4]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.3...v3.8.4
[3.8.3]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.2...v3.8.3
[3.8.2]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.1...v3.8.2
[3.8.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.8.0...v3.8.1
[3.8.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.7.0...v3.8.0
[3.7.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.6.0...v3.7.0
[3.6.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.5.0...v3.6.0
[3.5.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.4.1...v3.5.0
[3.4.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.4.0...v3.4.1
[3.4.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.3.1...v3.4.0
[3.3.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.3.0...v3.3.1
[3.3.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.1.3...v3.3.0
[3.1.3]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.1.2...v3.1.3
[3.1.2]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.1.1...v3.1.2
[3.1.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.1.0...v3.1.1
[3.1.0]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.0.4...v3.1.0
[3.0.4]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.0.3...v3.0.4
[3.0.3]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.0.2...v3.0.3
[3.0.2]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.0.1...v3.0.2
[3.0.1]: https://github.com/phunware/maas-core-ios-sdk/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/phunware/maas-core-ios-sdk/tree/v3.0.0

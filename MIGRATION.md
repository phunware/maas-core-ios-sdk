# PWCore Migration Guide
## Upgrade from 3.8.x to 3.9.x

#### General

This release adds API to control whether or not location updates can be requested. Finally, the distribution packaging format has been updated to use the new XCFramework binary format.

#### Upgrade Steps

1. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.9.x'`, then run `pod update` in the Terminal to update the framework. NOTE: Including PWCore in the `Podfile` is only required when used as a standalone Phunware SDK.

#### Change Detail

###### PWCore

*ADDED*

* `+ (void)enableLocationAccess:(BOOL)enable`

* `+ (BOOL)isLocationAccessEnabled`

## Upgrade from 3.7.x to 3.8.x

#### General

This release adds automatic screen view analytic events and simplifies the analytic custom event API. New `addCustomEvent` methods will appear in the new Maas Portal analytics dashboard. Existing deprecated `addEvent` methods will continue to appear in the old Maas Portal analytics dashboard.

#### Upgrade Steps

1. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.8.x'`, then run `pod update` in the Terminal to update the framework. This is only necessary if using PWCore by itself. Otherwise the correct version will be installed with PWLocation/PWMapKit or PWEngagement if using it bundled.

2. Replace occurrences of the following deprecated methods with their counter parts:

`+ (void)addEvent:(NSString *__nonnull)eventName __deprecated`
with
`+ (void)addCustomEvent:(NSString *__nonnull)eventName`

`+ (void)addEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters __deprecated`
with
`+ (void)addCustomEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters`

#### Change Detail

###### PWAnalytics

*ADDED*

* `+ (void)addCustomEvent:(NSString *__nonnull)eventName`

* `+ (void)addCustomEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters`

* `+ (void)setScreenName:(NSString *__nonnull)screenName`

* `+ (void)setAppSection:(NSString *__nullable)appSection`

* `+ (void)setGlobalParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters`

* `+ (void)enableAutomaticScreenViewEvents:(BOOL)enable`

*DEPRECATED*

* `+ (void)addEvent:(NSString *__nonnull)eventName __deprecated`

* `+ (void)addEvent:(NSString *__nonnull)eventName eventNamespace:(NSString *__nonnull)eventNamespace __deprecated`

* `+ (void)addEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters __deprecated`

* `+ (void)addEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters eventNamespace:(NSString *__nullable)eventNamespace __deprecated`

* `+ (void)startTimedEvent:(NSString *__nonnull)eventName __deprecated`

* `+ (void)startTimedEvent:(NSString *__nonnull)eventName eventNamespace:(NSString *__nullable)eventNamespace __deprecated`

* `+ (void)startTimedEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters __deprecated`

* `+ (void)startTimedEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters eventNamespace:(NSString *__nullable)eventNamespace __deprecated`

* `+ (void)pauseTimedEvent:(NSString *__nonnull)eventName __deprecated`

* `+ (void)resumeTimedEvent:(NSString *__nonnull)eventName __deprecated`

* `+ (void)endTimedEvent:(NSString *__nonnull)eventName __deprecated`

* `+ (void)endTimedEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters __deprecated`

* `+ (void)endTimedEvent:(NSString *__nonnull)eventName withParameters:(NSDictionary<NSString *, NSString *> *__nullable)parameters eventNamespace:(NSString *__nullable)eventNamespace __deprecated`

## Upgrade from 3.6.x to 3.7.x

#### General

The iOS deployment target of PWCore is now 10.0 instead of 9.0. To be compatible with PWCore, an application must have a minimum iOS deployment target of 10.0 as well.

#### Upgrade Steps

1. Update your applicable Xcode project settings to a minimum iOS deployment target of 10.0 or greater.

2. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.7.x'`, update your iOS platform to 10.0 or greater, then run `pod update` in the Terminal to update the framework.

## Upgrade from 3.5.x to 3.6.x

#### General

This release changed completion block object types for CME to support all content.

#### Upgrade Steps

1. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.6.x'`, then run `pod update` in the Terminal to update the framework. This is only necessary if using PWCore by itself. Otherwise the correct version will be installed with PWLocation/PWMapKit or PWEngagement if using it bundled.

2. Replace occurrences of the following deprecated methods with their counter parts:

`+ (void)getContentForContentID:(NSString *)contentID containerID:(NSString *)containerID structureID:(NSInteger)structureID parentID:(NSString *)parentID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(NSDictionary *contents))success failure:(void (^)(NSError *error))failure;`
with
`+ (void)getContentForContentID:(NSString *)contentID containerID:(NSString *)containerID structureID:(NSInteger)structureID parentID:(NSString *)parentID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(id content))success failure:(void (^)(NSError *error))failure`

`+ (void)getContentForContentID:(NSString *)contentID containerID:(NSString *)containerID structureID:(NSInteger)structureID success:(void(^)(NSDictionary *content))success failure:(void (^)(NSError *error))failure`
with
`+ (void)getContentForContentID:(NSString *)contentID containerID:(NSString *)containerID structureID:(NSInteger)structureID success:(void(^)(id content))success failure:(void (^)(NSError *error))failure`

`+ (void)getAllContentsForContainerID:(NSString *)containerID depth:(NSInteger)depth limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(NSArray *contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`
with
`+ (void)getAllContentsForContainerID:(NSString *)containerID depth:(NSInteger)depth limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(id contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`

`+ (void)getContentsForContainerID:(NSString *)containerID structureID:(NSInteger)structureID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(NSArray *contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`
with
`+ (void)getContentsForContainerID:(NSString *)containerID structureID:(NSInteger)structureID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(id contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`

`+ (void)getContentsForContainerID:(NSString *)containerID parentID:(NSString *)parentID structureID:(NSInteger)structureID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(NSArray *contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`
with
`+ (void)getContentsForContainerID:(NSString *)containerID parentID:(NSString *)parentID structureID:(NSInteger)structureID limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(id contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`

`+ (void)deleteContentChildrenForContentID:(NSString *)contentID success:(void (^)(void))success failure:(void (^)(NSError *error))failure __deprecated`
with
`+ (void)deleteContentForContentID:(NSString *)contentID traverse:(BOOL)traverse success:(void (^)(void))success failure:(void (^)(NSError *error))failure`

`+ (void)getAllContentsForContainerID:(NSString *)containerID depth:(NSInteger)depth success:(void(^)(NSDictionary *contents))success failure:(void (^)(NSError *error))failure __attribute__((deprecated))`
with
`+ (void)getAllContentsForContainerID:(NSString *)containerID depth:(NSInteger)depth limit:(NSInteger)limit offset:(NSInteger)offset success:(void(^)(id contents, PWPagination *pagination, BOOL pagingEnabled))success failure:(void (^)(NSError *error))failure`

#### Change Detail

###### PWCME

*REMOVED*

* `+ (void)deleteContentChildrenForContentID:(NSString *)contentID success:(void (^)(void))success failure:(void (^)(NSError *error))failure __deprecated`
* `+ (void)getAllContentsForContainerID:(NSString *)containerID depth:(NSInteger)depth success:(void(^)(NSDictionary *contents))success failure:(void (^)(NSError *error))failure __attribute__((deprecated))`

## Upgrade from 3.4.x to 3.5.x

#### General

This release removes location permission prompting from the SDK to align with best practices. App developers will now be required to do this manually.

#### Upgrade Steps

1. If your app requires location permissions, please follow [Apple's Best Practices](https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services) for requesting location permissions.

## Upgrade from 3.3.x to 3.4.x

#### General

This release added userInfo object to completion block of fetchBundleWithURL: and fetchBuildingBundleById: to provide additional information when using cached bundle.

#### Upgrade Steps

1. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.4.x'`, then run `pod update` in the Terminal to update the framework. This is only necessary if using PWCore by itself. Otherwise the correct version will be installed with PWLocation/PWMapKit or PWEngagement if using it bundled.

2. Replace occurrences of the following deprecated methods with their counter parts:

`fetchBundleWithURL:(NSURL *)url completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`
with
`fetchBundleWithURL:(NSURL *)url withCompletion:(PWBundleFetchCompletion)completion`

`fetchBundleWithURL:(NSURL *)url decryptionKey:(NSString *)decryptionKey completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion`
with
`fetchBundleWithURL:(NSURL *)url decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion`

`- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`
with
`- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry withCompletion:(PWBundleFetchCompletion)completion;`

`- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry decryptionKey:(NSString *)decryptionKey completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`
with
`- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion;`

`- (void)fetchBuildingBundleById:(NSInteger)buildingId draft:(BOOL)isDraft completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`
with
`- (void)fetchBuildingBundleById:(NSInteger)buildingId draft:(BOOL)isDraft withCompletion:(PWBundleFetchCompletion)completion;`

#### New

* Completion blocks for fetching of the bundle now contain an additional userInfo object with information regarding the use of a cached bundle.

#### Change Detail

###### PWBundleManager

*ADDED*

* `- (void)fetchBundleWithURL:(NSURL *)url withCompletion:(PWBundleFetchCompletion)completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry withCompletion:(PWBundleFetchCompletion)completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion;`

* `- (void)fetchBuildingBundleById:(NSInteger)buildingId draft:(BOOL)isDraft withCompletion:(PWBundleFetchCompletion)completion;`

*DEPRECATED*

* `- (void)fetchBundleWithURL:(NSURL *)url completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url decryptionKey:(NSString *)decryptionKey completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`

* `- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry decryptionKey:(NSString *)decryptionKey completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`

* `- (void)fetchBuildingBundleById:(NSInteger)buildingId draft:(BOOL)isDraft completion:(void(^)(NSString *bundleDirectory, BOOL bundleChanged, NSError *error))completion;`

## Upgrade from 3.1.x to 3.3.x

#### General

This release has some changes to support our new Location BLE provider.

#### Upgrade Steps

1. Open the `Podfile` from your project and change PWCore to include `pod 'PWCore', '3.3.x'`, then run `pod update` in the Terminal to update the framework. This is only necessary if using PWCore by itself. Otherwise the correct version will be installed with PWLocation/PWMapKit or PWEngagement if using it bundled.

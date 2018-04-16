# PWCore Migration Guide
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

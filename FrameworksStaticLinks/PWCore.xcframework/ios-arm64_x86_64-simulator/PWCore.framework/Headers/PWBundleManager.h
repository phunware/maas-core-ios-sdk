//
//  PWBundleManager.m
//  PWCore
//
//  Created by Xiangwei Wang on 07/11/2016.
//  Copyright © 2016 Phunware Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * The type of response code from fetchBundle.
 */
typedef NS_ENUM(NSInteger, PWMEFetchBundleResponseCode) {
    // Response code for when file is missing or access is denied.
    PWMEFetchBundleResponseCodeFileMissing = 403
};

/*
 Completion block for a bundle fetch.
 */
typedef void(^PWBundleFetchCompletion)(NSString * _Nullable bundleDirectory, NSDictionary * _Nullable userInfo, NSError * _Nullable error);

/*
 Key for userInfo in PWBundleFetchCompletion that explains why a failure to update the bundle occurred.
 */
extern NSString * const PWBundleUpdateFailureKey;
/*
 Key for userInfo in PWBundleFetchCompletion that reports if the bundle was changed or if it was taken from cache.
 */
extern NSString * const PWBundleChangedKey;

/**
 A generic class for download/decrypt/unzip a bundle for specific URL.
 */
@interface PWBundleManager : NSObject

/**
 The timeout for network request to get the bundle before falling back to the cached version. This is only used if a cached bundle exists, for non-cached bundles the default of 60 seconds is used. If this is not set at all, the default of 10 seconds is used.
 */
@property (nonatomic) NSTimeInterval cacheFallbackTimeoutOverride;

/**
 Shared `PWBundleManager`.
 */
+ (PWBundleManager *)sharedInstance;

/**
 Remove the bundle for a specific url.
 @param url The specific url for which you want to remove.
 */
- (void)removeBundleForURL:(NSURL *)url;

/**
 Fetch an unencrypted bundle from the url, unpack it, and save the necessary JSON files
 @param url The url that the manager should load.
 @param completion A block that returns the unzipped bundle directory or error.
 */
- (void)fetchBundleWithURL:(NSURL *)url withCompletion:(PWBundleFetchCompletion)completion;

/**
 Fetch an encrypted bundle from the url, decprypt then unpack it, and save the necessary JSON files
 @param url The url that the manager should load.
 @param decryptionKey The key used to deprypt the bundle.
 @param completion A block that returns information about the bundle fetch and the unzipped bundle directory or error.
 */
- (void)fetchBundleWithURL:(NSURL *)url decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion;

/**
 Fetch an unencrypted bundle from the url, unpack it, and save the necessary JSON files
 @param url The url that the manager should load.
 @param retryInterval The interval to attempt retry.
 @param maxRetry The maximum no of times to retry.
 @param completion A block that returns information about the bundle fetch and the unzipped bundle directory or error.
 */
- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry withCompletion:(PWBundleFetchCompletion)completion;

/**
 Fetch an encrypted bundle from the url, decprypt then unpack it, and save the necessary JSON files
 @param url The url that the manager should load.
 @param decryptionKey The key used to deprypt the bundle.
 @param retryInterval The interval to attempt retry.
 @param maxRetry The maximum no of times to retry.
 @param completion A block that returns information about the bundle fetch and the unzipped bundle directory or error.
 */
- (void)fetchBundleWithURL:(NSURL *)url retryInterval:(NSInteger)retryInterval maxRetry:(NSInteger)maxRetry decryptionKey:(NSString *)decryptionKey withCompletion:(PWBundleFetchCompletion)completion;

/**
 Fetch building bundle for the specified building identifier, decprypt then unpack it, and save the necessary JSON files
 @param buildingId The building identifier.
 @param isDraft Tell it's a draft or live bundle.
 @param completion A block that returns information about the bundle fetch and the unzipped bundle directory or error.
 */
- (void)fetchBuildingBundleById:(NSInteger)buildingId draft:(BOOL)isDraft withCompletion:(PWBundleFetchCompletion)completion;

/**
 Fetch campus bundle for the specified campus identifier, unzip campus bundle, decprypt building bundles then unpack them, and save the necessary JSON files
 @param campusId The campus identifier.
 @param isDraft Tell it's a draft or live bundle.
 @param completion A block that returns information about the bundle fetch and the unzipped bundle directory or error.
 */
- (void)fetchCampusBundleById:(NSInteger)campusId draft:(BOOL)isDraft withCompletion:(PWBundleFetchCompletion)completion;

@end

NS_ASSUME_NONNULL_END

//
//  PWCore.h
//  PWCore
//
//  Copyright (c) 2015 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PWCore/PWAnalytics.h>
#import <PWCore/UIViewController+PWAnalytics.h>
#import <PWCore/PWCME.h>
#import <PWCore/PWLogger.h>
#import <PWCore/PWConsoleLogger.h>
#import <PWCore/PWFileLogger.h>
#import <PWCore/PWLoggableObject.h>
#import <PWCore/PWBundleManager.h>
#import <PWCore/PWAPIManager.h>
#import <PWCore/PWAPIRequestOperation.h>
#import <PWCore/PWAPIOperation.h>
#import <PWCore/PWCoreDevice.h>
#import <PWCore/PWFeatureFlagger.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const PWCoreVersion = @"3.11.0";

/**
 `PWCore` implements core functionality used in all MaaS modules. All MaaS modules have a `PWCore` dependency.
 */

typedef NS_CLOSED_ENUM(NSInteger, PWEnvironment) {
    PWEnvironmentProd,
    PWEnvironmentStage,
    PWEnvironmentDev
};

@interface PWCore : NSObject

///-----------------------
/// @name Required Methods
///-----------------------

/**
 Initializes PWCore and all associated MaaS modules. This method should be called inside `application:didFinishLaunchingWithOptions:` before you do anything else.
 @param applicationID You can find your Application ID in the MaaS portal.
 @param accessKey A unique key that identifies the client making the request. You can find your Access Key in the MaaS portal.
 @param signatureKey A unique key that is used to sign requests. The signature is used to both check request authorization as well as data integrity. You can find your Signature Key in the MaaS portal.
 */
+ (void)setApplicationID:(NSString *)applicationID
               accessKey:(NSString *)accessKey
            signatureKey:(NSString *)signatureKey;

/**
 Returns the MaaS Application ID.
 */
+ (NSString *)applicationID;

/**
 Returns the Device ID.
 */
+ (NSString *)deviceID;

/**
 Returns 'PWCore'.
 */
+ (NSString *)serviceName;

/**
 This method registers the module and its version.
 @param moduleName The name of the dependent module to be registered.
 @param version version number for the module
 @param completion The completion block to be called.
 */
+ (void)registerModule:(NSString *)moduleName version:(NSString *)version withCompletion:(void(^ _Nullable)(NSError * _Nullable error))completion;

/**
 Returns a dictionary of registered modules.
 */
+ (NSDictionary * _Nullable)getAllRegisteredModules;

/**
 Returns version number for a registered module.
 @param moduleName The name of the dependent module to be registered.
 */
+ (NSString * _Nullable)getVersionForModule:(NSString *)moduleName;

#pragma mark - Configuration Options

/**
 Determines whether location updates are permitted.
 @param enable Will permit location updates and include location information in analytic events.  Default is enabled.
 */
+ (void)enableLocationAccess:(BOOL)enable;

/**
 Returns whether location updates are permitted.
 */
+ (BOOL)isLocationAccessEnabled;

#pragma mark - Internal Use Only

+ (NSString *)sessionID;

#pragma mark Environment

+ (PWEnvironment)getEnvironment;

+ (void)setEnvironment:(PWEnvironment)environment;

+ (NSString * _Nullable)accessKey;

+ (NSString * _Nullable)server;

+ (NSMutableDictionary *)standardAnalyticsPayload;

#pragma mark Analytics

+ (void)sendInternalAnalyticsPayload:(NSDictionary *)payload completion:(void (^ _Nullable)(NSError * _Nullable error))completion;

// Send analytics with Extra payload
+ (void)sendExtraAnalyticsPayload:(NSDictionary *)payload completion:(void (^ _Nullable)(NSError * _Nullable error))completion;

#pragma mark Modules

+ (void)registerPhunwareModule:(NSString *)moduleName version:(NSString *)version withCompletion:(void (^ _Nullable)(NSError * _Nullable error))completion;

#pragma mark Encryption

+ (NSData * _Nullable)encryptData:(NSData *)data withKey:(NSString *)key;

+ (NSData * _Nullable)decryptData:(NSData *)data withKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

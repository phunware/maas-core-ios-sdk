//
//  PWAnalytics.h
//  PWCore
//
//  Copyright (c) 2015 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 `PWAnalytics` enables easy implementation of application workflow analytics. PWAnalytics supports standard analytics events, timed events, and event parameters.
 */

@interface PWAnalytics : NSObject

///-----------------------
/// @name Event Methods
///-----------------------

/**
 Add an event to the analytics queue.
 @param eventName Name of the event. 
 */
+ (void)addCustomEvent:(NSString *)eventName;

/**
 Add an event to the analytics queue. Parameters must follow these rules:
 (1) Keys and values must be NSString objects.
 (2) There may be no more than 5 parameters. Extra parameters will be ignored.
 (3) Each key or value that is longer than 40 characters will be truncated on server.
 @param eventName Name of the event.
 @param parameters `NSString` key / value parameters. For example, `@{@"key" : @"value"}`.
 */
+ (void)addCustomEvent:(NSString *)eventName withParameters:(NSDictionary<NSString *, NSString *> * _Nullable)parameters;

/**
 Set a screen name for automatic screen view events. This should be set in the `viewWillAppear` callback of your view controller before calling `super viewWillAppear`.
 @param screenName Screen name for the view event.
 */
+ (void)setScreenName:(NSString *)screenName;

/**
 Set an app section for automatic screen view events. This should be set in the `viewWillAppear` callback of your view controller before calling `super viewWillAppear`.
 @param appSection App section for the view event.
 */
+ (void)setAppSection:(NSString * _Nullable)appSection;

/**
 Set global parameters for all events. This should be set in the `viewWillAppear` callback of your view controller before calling `super viewWillAppear`.
 @param parameters Parameters included for all events until cleared.
 */
+ (void)setGlobalParameters:(NSDictionary<NSString *, NSString *> * _Nullable)parameters;

/**
 Determines whether automatic screen views are captured.
 @param enable Will automatically capture screen view events or not. Defaults to enabled.
 */
+ (void)enableAutomaticScreenViewEvents:(BOOL)enable;

@end

NS_ASSUME_NONNULL_END

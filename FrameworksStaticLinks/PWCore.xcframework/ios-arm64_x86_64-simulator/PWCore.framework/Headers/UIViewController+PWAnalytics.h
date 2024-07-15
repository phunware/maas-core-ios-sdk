//
//  UIViewController+PWAnalytics.h
//  PWCore
//
//  Created by Troy Stump on 6/5/20.
//  Copyright © 2020 Phunware. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PWAnalytics)

/**
 Start a screen view event.
 
 Using this method to start a screen view event requires automatic screen view events to be disabled. Please see  `PWAnalytics.enableAutomaticScreenViewEvents:` for more info on automatic screen view events.
 
 @param screenName The screen name of the screen view event.
 @param appSection The app section associated with the screen view event.
 @param parameters Additional information that describes the screen view event.
 @return YES if the screen view event started, otherwise NO.
*/
- (BOOL)pw_startScreenViewEventForScreenWithName:(NSString *)screenName inAppSection:(NSString * _Nullable)appSection withParameters:(NSDictionary<NSString *, NSString *> * _Nullable)parameters;

/**
 End a screen view event.
 
 Using this method to end a screen view event requires automatic screen view events to be disabled. Please see  `PWAnalytics.enableAutomaticScreenViewEvents:` for more info on automatic screen view events.
 
 @return YES if the screen view event ended, otherwise NO.
*/
- (BOOL)pw_endScreenViewEvent;

@end

NS_ASSUME_NONNULL_END

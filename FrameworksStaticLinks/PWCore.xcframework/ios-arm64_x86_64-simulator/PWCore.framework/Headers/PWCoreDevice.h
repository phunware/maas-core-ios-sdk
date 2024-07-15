//
//  PWCoreDevice.h
//  PWCore
//
//  Copyright (c) 2015 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeKey;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoValueKey;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeIDFA;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeIDFV;

@interface PWCoreDevice : NSObject

+ (NSString *)hardwareModel;
+ (NSString *)IPAddress;
+ (NSString *)timestamp;
+ (NSString *)systemVersion;
+ (NSString *)connection;
+ (NSString *)userAgent;
+ (BOOL)pushEnabled;

+ (NSDictionary *)locationInfo;
+ (nullable NSString *)uniqueGlobalDeviceIdentifier;
+ (NSDictionary<NSString *, NSString *> *)uniqueGlobalDeviceIdentifierInfo;

// Convenience
+ (NSDateFormatter *)standardDateFormatter;

@end

NS_ASSUME_NONNULL_END

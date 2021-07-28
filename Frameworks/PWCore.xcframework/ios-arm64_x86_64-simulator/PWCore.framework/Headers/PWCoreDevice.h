//
//  PWCoreDevice.h
//  PWCore
//
//  Copyright (c) 2015 Phunware. All rights reserved.
//
#import <Foundation/Foundation.h>

extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeKey;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoValueKey;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeIDFA;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeIDFV;
extern NSString * const PWCoreDeviceGlobalDeviceIdentifierInfoTypeMAC;

@interface PWCoreDevice : NSObject

+ (NSString *)macaddress;
+ (NSString *)hardwareModel;
+ (NSString *)IPAddress;
+ (NSString *)carrierName;
+ (NSString *)timestamp;
+ (NSString *)systemVersion;
+ (NSDictionary *)currentWifi;
+ (NSString *)connection;
+ (NSString *)userAgent;
+ (BOOL)wifiEnabled;
+ (BOOL)pushEnabled;
+ (BOOL)bluetoothEnabled;

+ (NSDictionary *)locationInfo;
+ (NSString *)uniqueDeviceIdentifier;
+ (NSString *)uniqueGlobalDeviceIdentifier;
+ (NSDictionary<NSString *, NSString *> *)uniqueGlobalDeviceIdentifierInfo;

// Convenience
+ (NSDateFormatter *)standardDateFormatter;

@end

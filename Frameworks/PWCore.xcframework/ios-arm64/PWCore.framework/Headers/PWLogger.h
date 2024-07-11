//
//  PWLogger.h
//  PWCore
//
//  Created on 3/19/15.
//  Copyright (c) 2015 Phunware Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PWCore/PWLogMessage.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kPWLogCategoryKey;
extern NSString * const kPWLogCategoryNetworking;
extern NSString * const kPWLogCategoryGeneral;

extern void __attribute__((overloadable)) PWLogError(NSString *service, NSString *message);
extern void __attribute__((overloadable)) PWLogError(NSString *service, NSString *message, NSDictionary * _Nullable details);

extern void __attribute__((overloadable)) PWLogWarning(NSString *service, NSString *message);
extern void __attribute__((overloadable)) PWLogWarning(NSString *service, NSString *message, NSDictionary * _Nullable details);

extern void __attribute__((overloadable)) PWLogInfo(NSString *service, NSString *message);
extern void __attribute__((overloadable)) PWLogInfo(NSString *service, NSString *message, NSDictionary * _Nullable details);

extern void __attribute__((overloadable)) PWLogDebug(NSString *service, NSString *message);
extern void __attribute__((overloadable)) PWLogDebug(NSString *service, NSString *message, NSDictionary * _Nullable details);

typedef NS_ENUM(NSUInteger, PWLogLevel) {
    /** Specifies all logging as disabled. This is the default logging level.
     */
    PWLogLevelNone,
    
    /** Only log errors.
     */
    PWLogLevelError,
    
    /** Log warnings and errors.
     */
    PWLogLevelWarning,
    
    /** Log information, warnings and errors.
     */
    PWLogLevelInfo,
    
    /** Logs all messages.
     */
    PWLogLevelDebug
};


@protocol PWLogging <NSObject>

/**
 * The name of the service that corresponds to the logger. 
 * @discussion Each logger will only log messages tagged with the same service name as the logger.
 */
@property (nonatomic, readonly) NSString *serviceName;
/** 
 * The base level of the logger.
 * @discussion This property can be set to filter out log messages depending on their type. See the 'PWLogLevel' enum for more details.
 */
@property (nonatomic) PWLogLevel baseLevel;

/**
 * Indicates if the logger needs to execute in the background
 * @discussion If the property is true, the logMessage: method will be executed using an asynchronous dispatch queue
 */
@property (nonatomic, readonly) BOOL asyncLogging;

/**
 * initializer
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 * initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 * Convenience constructor to create logger
 * @param serviceName The service name that corresponds to the logger.
 */
+ (instancetype)loggerWithServiceName:(NSString *)serviceName;

/**
 * Logs a message using the logger.
 * @discussion  Log messages whose type is lower than the logger base level will cause this method to be called
 * @param logMessage The logmessage to be logged.
 */
- (void)logMessage:(PWLogMessage *)logMessage;

@end

@interface PWLogger: NSObject

/**
 * Enables or disables console logging for the service.
 * @param enabled Enable or disable to the console logger.
 * @param serviceName Service to log
 */
+ (void)consoleLoggingEnabled:(BOOL)enabled forService:(NSString *)serviceName;

/**
 * Enables or disables file logging for the service.
 * @param enabled Enable or disable to the file logger.
 * @param serviceName Service to log
 */
+ (void)fileLoggingEnabled:(BOOL)enabled forService:(NSString *)serviceName;

/**
 * Logs a message using all the loggers added to the logging module.
 *
 * @param serviceName The service name that corresponds to the message. Only loggers with the same service name will receive the message.
 * @param message The main message content of the log message.
 * @param type The type of the message. Only loggers with a base level equal or below the message type will proceed log the message. See the 'PWLogType' and 'PWLogLevel' enums.
 * @param file The file where the message was logged.
 * @param function The function from where the message was logged.
 * @param line The line number inside the file where the message was logged.
 * @param dictionary A dictionary of values to store in the log.
 */

+ (void)logForService:(NSString *)serviceName message:(NSString *)message type:(PWLogType)type file:(const char *)file function:(const char *)function line:(NSUInteger)line dictionary:(NSDictionary * _Nullable)dictionary;

/**
 * Adds a logger to the logging module.
 * @param logger The logger to add. It must conform to PWLogging.
 */
+ (void)addLogger:(id<PWLogging>)logger;

/**
 * Removes a logger from the logging module
 * @param logger The logger to remove.
 */
+ (void)removeLogger:(id<PWLogging>)logger;

/**
 * Sets all the loggers log level.
 * @param logLevel The log level to log.
 */
+ (void)setLoggersLogLevel:(PWLogLevel)logLevel;

/**
 * Sets all the loggers log level for a service.
 * @param logLevel The log level to log.
 * @param serviceName The service to set the log level on.
 */
+ (void)setLoggersLogLevel:(PWLogLevel)logLevel forService:(NSString *)serviceName;

/**
 * Enables or disables logging internal errors.
 * @param logInternalErrors A BOOL value that indicates whether internal errors should be logged.
 */
+ (void)setLogInternalError:(BOOL)logInternalErrors;

/**
 * Displays MFMailComposeViewController to email logs.
 */
+ (void)emailLogs;

/**
 * Displays MFMailComposeViewController to email logs.
 * @param serviceName The service to send the logs for.
 */
+ (void)emailLogsForService:(NSString *)serviceName;

@end

NS_ASSUME_NONNULL_END

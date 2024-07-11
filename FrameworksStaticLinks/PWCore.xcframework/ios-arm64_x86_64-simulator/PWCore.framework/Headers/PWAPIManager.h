//
//  PWAPIManager.h
//  PWCore
//
//  Created by Xiangwei Wang on 06/12/2016.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PWCore/PWAPIOperation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 A generic class for making HTTP/HTTPS calls, and the authentication header will be automatically added.
 */
@interface PWAPIManager : NSObject

/**
 Shared `PWAPIManager`
 */
+ (PWAPIManager *)sharedInstance;

/**
 Send a `GET` request for specific endpoint and parameters.
 @param endpoint The endpoint for the request.
 @param parameters The parameters for the request.
 @param completion A block that returns the HTTP response or error.
 */
- (void)get:(NSString *)endpoint withParameters:(NSDictionary * _Nullable)parameters withCompletion:(void(^)(id _Nullable response, NSError * _Nullable error))completion;

/**
 Send a `GET` request for specific endpoint and parameters.
 @param endpoint The endpoint for the request.
 @param parameters The parameters for the request.
 @param shouldFallBackToCache If true and the request fails, the cached response (if any) is returned instead. Also if true and the request succeeds, the response is cached.
 @param completion A block that returns the HTTP response or error.
 */
- (void)get:(NSString *)endpoint withParameters:(NSDictionary * _Nullable)parameters fallingBackToCache:(BOOL)shouldFallBackToCache  withCompletion:(void(^)(id _Nullable response, NSError * _Nullable error))completion;

/**
 Send a `GET` request for specific endpoint and parameters, and the response may be fetched from the cache.
 @param endpoint The endpoint for the request.
 @param parameters The parameters for the request.
 @param completion A block that returns the HTTP response or error.
 @discussion The HTTP response is cached for 24 hours, so it will return you the cached data if you request again in 24 hours. You can use `get:...` if you want to get the real-time response.
 */
- (void)getCached:(NSString *)endpoint withParameters:(NSDictionary * _Nullable)parameters withCompletion:(void(^)(id _Nullable response, NSError * _Nullable error))completion;

/**
 Send a `POST` request for specific endpoint and parameters.
 @param endpoint The endpoint for the request.
 @param parameters The parameters for the request.
 @param completion A block that returns the HTTP response or error.
 */
- (void)post:(NSString *)endpoint withParameters:(NSDictionary * _Nullable)parameters withCompletion:(void(^)(id _Nullable response, NSError * _Nullable error))completion;

/**
 Send a request for specific endpoint, parameters and HTTP method.
 @param httpMethod The http request for the request.
 @param endpoint The endpoint for the request.
 @param parameters The parameters for the request.
 @param shouldCacheResponse If true and the request fails, the cached response (if any) is returned instead. Also if true and the request succeeds, the response is cached.
 @param completion A block that returns the HTTP response or error.
 */
- (void)request:(NSString *)endpoint withHTTPMethod:(PWHTTPMethod)httpMethod withParameters:(NSDictionary * _Nullable)parameters cacheResponse:(BOOL)shouldCacheResponse withCompletion:(void(^)(id _Nullable response, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END

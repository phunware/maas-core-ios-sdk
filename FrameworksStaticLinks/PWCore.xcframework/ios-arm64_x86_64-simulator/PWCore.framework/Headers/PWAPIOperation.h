//
//  PWAPIOperation.h
//  PWCore
//
//  Created by Illya Busigin on 8/10/15.
//  Copyright (c) 2015 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * PWHTTPMethod NS_TYPED_ENUM;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodConnect;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodDelete;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodGet;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodHead;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodOptions;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodPatch;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodPost;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodPut;
FOUNDATION_EXPORT PWHTTPMethod const PWHTTPMethodTrace;

@class PWAPIOperation;
typedef void (^PWAPIOperationSuccess)(PWAPIOperation *operation, id _Nullable responseObject);
typedef void (^PWAPIOperationFailure)(PWAPIOperation *operation, NSError *error);

@interface PWAPIOperation : NSOperation

@property (nonatomic, copy, readonly) PWHTTPMethod HTTPMethod;
@property (nonatomic, copy, readonly) NSString *URLString;
@property (nonatomic, copy, readonly, nullable) id parameters;
@property (nonatomic, copy, readonly) NSDictionary<NSString *, NSString *> *headers;
@property (nonatomic, copy, nullable) PWAPIOperationSuccess successBlock;
@property (nonatomic, copy, nullable) PWAPIOperationFailure failureBlock;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithHTTPMethod:(PWHTTPMethod)HTTPMethod URLString:(NSString *)URLString parameters:(id _Nullable)parameters headers:(NSDictionary<NSString *, NSString *> * _Nullable)headers NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

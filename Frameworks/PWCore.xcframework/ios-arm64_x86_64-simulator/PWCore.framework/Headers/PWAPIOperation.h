//
//  PWAPIOperation.h
//  PWCore
//
//  Created by Illya Busigin on 8/10/15.
//  Copyright (c) 2015 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PWAPIOperation;

typedef void (^PWAPIOperationSuccess)(PWAPIOperation *operation, id _Nullable responseObject);
typedef void (^PWAPIOperationFailure)(PWAPIOperation *operation, NSError *error);

@protocol PWAPIRequest <NSObject>

@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSString *HTTPMethod;
@property (nonatomic, copy) id parameters;
@property (nonatomic, copy) NSDictionary *allHTTPHeaderFields;

@property (nonatomic, copy, nullable) PWAPIOperationSuccess successBlock;
@property (nonatomic, copy, nullable) PWAPIOperationFailure failureBlock;

@end


@interface PWAPIOperation : NSOperation <PWAPIRequest>

@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSString *HTTPMethod;
@property (nonatomic, copy) id parameters;
@property (nonatomic, copy) NSDictionary *allHTTPHeaderFields;

@property (nonatomic, copy, nullable) PWAPIOperationSuccess successBlock;
@property (nonatomic, copy, nullable) PWAPIOperationFailure failureBlock;

@end

NS_ASSUME_NONNULL_END

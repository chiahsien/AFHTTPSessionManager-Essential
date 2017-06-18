//
//  APIManager.h
//  AFHTTPSessionManager Essential
//
//  Created by Nelson on 2017/6/18.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager+ReactiveObjC.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END


//
//  AFHTTPSessionManager+ReactiveCocoa.h
//  AFHTTPSessionManager Essential
//
//  Created by Nelson on 2017/6/18.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (ReactiveObjC)

- (RACSignal *)rac_GET:(NSString *)urlString parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_POST:(NSString *)urlString parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_PUT:(NSString *)urlString parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_DELETE:(NSString *)urlString parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END

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

/**
 * Creates and runs an `RACSignal` with a `GET` request.
 *
 * @param URLString The URL string used to create the request URL.
 * @param parameters The parameters to be encoded according to the client request serializer.
 * @return A `RACSignal` object that sends the responseObject then completed, or sends error if any occurs.
 */
- (RACSignal *)rac_GET:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 * Creates and runs an `RACSignal` with a `POST` request.
 *
 * @param URLString The URL string used to create the request URL.
 * @param parameters The parameters to be encoded according to the client request serializer.
 * @return A `RACSignal` object that sends the responseObject then completed, or sends error if any occurs.
 */
- (RACSignal *)rac_POST:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 * Creates and runs an `RACSignal` with a `PUT` request.
 *
 * @param URLString The URL string used to create the request URL.
 * @param parameters The parameters to be encoded according to the client request serializer.
 * @return A `RACSignal` object that sends the responseObject then completed, or sends error if any occurs.
 */
- (RACSignal *)rac_PUT:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 * Creates and runs an `RACSignal` with a `DELETE` request.
 *
 * @param URLString The URL string used to create the request URL.
 * @param parameters The parameters to be encoded according to the client request serializer.
 * @return A `RACSignal` object that sends the responseObject then completed, or sends error if any occurs.
 */
- (RACSignal *)rac_DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END

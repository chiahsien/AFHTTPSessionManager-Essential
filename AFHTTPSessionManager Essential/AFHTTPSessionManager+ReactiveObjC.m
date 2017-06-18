//
//  AFHTTPSessionManager+ReactiveCocoa.m
//  AFHTTPSessionManager Essential
//
//  Created by Nelson on 2017/6/18.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "AFHTTPSessionManager+ReactiveObjC.h"

@implementation AFHTTPSessionManager (ReactiveObjC)

- (RACSignal *)rac_GET:(NSString *)urlString parameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_POST:(NSString *)urlString parameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_PUT:(NSString *)urlString parameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self PUT:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_DELETE:(NSString *)urlString parameters:(NSDictionary *)parameters {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end

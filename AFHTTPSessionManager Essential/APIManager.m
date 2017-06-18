//
//  APIManager.m
//  AFHTTPSessionManager Essential
//
//  Created by Nelson on 2017/6/18.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

#pragma mark - Life cycle

+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });

    return _sharedManager;
}

- (instancetype)init {
    self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.myapp.com"]];
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];

        [self.requestSerializer setValue:@"Specific Value" forHTTPHeaderField:@"Specific Header Field"];
    }
    return self;
}

#pragma mark - Override Methods

// Cloud api error is embedded in response data, so we need to sanitize it to get real error.
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                            completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    // http://stackoverflow.com/questions/19466291/afnetworking-2-0-add-headers-to-get-request
    // If necessary, you can modify header for each request.
    //    NSMutableURLRequest *req = [request mutableCopy];
    //    [req setValue:@"Specific Value" forHTTPHeaderField:@"Specific Header Field"];
    return [super dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (((NSHTTPURLResponse *)response).statusCode == 401) {
            [self refreshToken];
        }
        NSError *sanitizedError = [self sanitizeError:error withResponse:response responseObject:responseObject];
        completionHandler(response, responseObject, sanitizedError);
    }];
}

#pragma mark - Private methods

- (NSError *)sanitizeError:(NSError *)error withResponse:(NSURLResponse *)response responseObject:(id)responseObject {
    // Backend server returns `200 OK` and embeds status code within response JSON,
    // so we must respect the `error` if it is not nil.
    if (error) {
        return error;
    }

    if (!responseObject || ![responseObject isKindOfClass:[NSDictionary class]]) {
        return nil;
    }

    NSNumber *errorCode = responseObject[@"statusCode"];
    if (errorCode.integerValue != 200) {
        // Create domain specific error
        return [NSError errorWithDomain:@"domain.api.error" code:0 userInfo:nil];
    }
    return nil;
}

- (void)refreshToken {
    // Call API to refresh access token
    // Then set auth token to header
    [self setAuthorizationToken:@"qwerasdfzxcv1234"];
}

- (void)setAuthorizationToken:(NSString *)authToken {
    NSString *token = (authToken ? [NSString stringWithFormat:@"Bearer %@", authToken] : nil);
    [self.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
}

@end

//
//  MSGraphBatchTask.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphBatchRequest.h"

#define BatchRequestId @"id"
#define BatchRequestMethod @"method"
#define BatchRequestUrl @"url"
#define BatchRequestHeaders @"headers"
#define BatchRequestBody @"body"

@interface MSGraphBatchRequest()

@property NSMutableArray<MSGraphRequest *> *requests;

@end

@implementation MSGraphBatchRequest

-(instancetype)initWithRequests:(NSMutableArray<MSGraphRequest *> *)requests{
    self = [super init];
    if(self){
        self.requests = requests;
    }
    return self;

}

-(void)addRequest:(MSGraphRequest *)request{
    if(!self.requests)
        self.requests = [NSMutableArray new];
    [self.requests addObject:request];
}

-(NSDictionary *)getBatchRequestBody{
    NSDictionary *batchRequestBody = [NSDictionary new];
    NSMutableArray *batchedRequests = [NSMutableArray new];
    for(MSGraphRequest *request in batchRequestBody){
        NSMutableDictionary *requestDictionary = [NSMutableDictionary new];
        NSURLRequest *nativeRequest = [request getNativeRequestObject];
        [requestDictionary setObject:@"" forKey:BatchRequestId];
        [requestDictionary setObject:nativeRequest.HTTPMethod forKey:BatchRequestMethod];
        [requestDictionary setObject:[nativeRequest.URL absoluteString] forKey:BatchRequestUrl];
        if(nativeRequest.HTTPBody){
            [requestDictionary setObject:nativeRequest.HTTPBody forKey:BatchRequestBody];
        }
        if(nativeRequest.allHTTPHeaderFields){
            [requestDictionary setObject:nativeRequest.allHTTPHeaderFields forKey:BatchRequestHeaders];
        }
    }
    return batchRequestBody;
}

@end

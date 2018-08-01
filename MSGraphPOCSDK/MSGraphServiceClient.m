//
//  MSGraphServiceClient.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphServiceClient.h"
#import "MSGraphHTTPClient.h"
#import "MSGraphResponseHandler.h"
#import "MSGraphPOCSDK.h"

@interface MSGraphServiceClient()

@property MSGraphRequestBuilder *requestBuilder;
@property MSGraphResponseHandler *responseHandler;

@end

@implementation MSGraphServiceClient


-(instancetype)initWithAuthenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider{
    self = [super init];
    if(self){
        _httpClient = [[MSGraphHTTPClient alloc] initWithAuthenticationProvider:authenticationProvider baseUrl:GraphBaseUrl];
    }
    return self;
}


-(MSGraphRequestBuilder *)createRequestBuilder{
    if(!self.requestBuilder)
        self.requestBuilder = [MSGraphRequestBuilder new];

    return  self.requestBuilder;
}

-(MSGraphResponseHandler *)createResponseHandler{
    if(!self.responseHandler)
        self.responseHandler = [[MSGraphResponseHandler alloc] init];
    return self.responseHandler;
}


-(void)executeRequest:(MSGraphRequest *)request withCompletionHandler:(MSGraphReqeustCompletionHandler)handler{
    [self.httpClient executeRequest:[request getNativeRequestObject] withCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        MSGraphResponse *graphResopnse = [[MSGraphResponse alloc] initWithResponse:response data:data];
        handler(graphResopnse,error);

    }];
}

-(void)executeBatchRequest:(MSGraphBatchRequest *)batchRequest withCompletionHandler:(MSGraphBatchRequestCompletionHandler)handler{
    NSMutableURLRequest *nativeBatchRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[GraphBaseUrl stringByAppendingString:@"/$batch"]]];
    nativeBatchRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:[batchRequest getBatchRequestBody] options:kNilOptions error:nil];
    [self.httpClient executeRequest:nativeBatchRequest withCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        MSGraphBatchResponse *graphResopnse = [[MSGraphBatchResponse alloc] initWithResponse:response data:data];
        handler(graphResopnse,error);
    }];
}
@end

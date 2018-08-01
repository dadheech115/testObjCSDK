//
//  MSGraphHTTPClient.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphHTTPClient.h"
#import "MSAuthenticationProvider.h"

@implementation MSGraphHTTPClient


-(void)executeRequest:(NSMutableURLRequest *)request withCompletionHandler:(HTTPRequestCompletionHandler)handler{

    [self.authenticationProvider appendAuthenticationHeaders:request completion:^(NSMutableURLRequest *request, NSError *error){
        NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];

        NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            handler(data,response,error);
        }];

        [dataTask resume];
    }];
}

-(void)getAsynchronouslyFromPath:(NSString *)path withCompletionHandler:(HTTPRequestCompletionHandler)handler{
    NSMutableURLRequest *getRequest = [self createRequestFromPath:path params:nil httpMethod:@"GET"];

    [self executeRequest:getRequest withCompletionHandler:handler];

}

-(void)postAsynchronouslyToPath:(NSString *)path requestBody:(NSDictionary *)dictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler{
    NSMutableURLRequest *postRequest = [self createRequestFromPath:path params:dictionary httpMethod:@"POST"];

    [self executeRequest:postRequest withCompletionHandler:handler];

}

-(void)putAsynchronouslyAtPath:(NSString *)path requestBody:(NSDictionary *)dictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler{
    NSMutableURLRequest *putRequest = [self createRequestFromPath:path params:dictionary httpMethod:@"PUT"];

    [self executeRequest:putRequest withCompletionHandler:handler];

}

-(void)patchAsynchronouslyAtPath:(NSString *)path requestBody:(NSDictionary *)dictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler{
    NSMutableURLRequest *patchRequest = [self createRequestFromPath:path params:dictionary httpMethod:@"PATCH"];

    [self executeRequest:patchRequest withCompletionHandler:handler];

}

-(void)deleteAsynchronouslyFromPath:(NSString *)path withCompletionHandler:(HTTPRequestCompletionHandler)handler{
    NSMutableURLRequest *deleteRequest = [self createRequestFromPath:path params:nil httpMethod:@"DELETE"];

    [self executeRequest:deleteRequest withCompletionHandler:handler];

}

-(NSMutableURLRequest *)createRequestFromPath:(NSString *)path
                      params:(NSDictionary *)params
                  httpMethod:(NSString *)httpMethod{
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self.baseUrl stringByAppendingString:path]]];
    if(!httpMethod)
        httpMethod = @"GET";
    urlRequest.HTTPMethod = httpMethod;
    if(params)
        urlRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:params
                                                          options:0
                                                            error:nil];
    return urlRequest;

}



@end

//
//  MSGraphRequest.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphRequest.h"

@interface MSGraphRequest ()

@property NSURL *url;
@property NSDictionary *parametersDictionary;
@property NSString *httpMethod;
@property NSDictionary *headerDictioanry;

@end

@implementation MSGraphRequest

-(instancetype)initWithURL:(NSURL *)url
                parameters:(NSDictionary *)dictionary
                httpMethod:(NSString *)httpMethod{
    self = [super init];
    if(self){
        self.url = url;
        self.parametersDictionary = dictionary;
        self.httpMethod = httpMethod;
    }
    return self;
}

-(NSMutableURLRequest *)getNativeRequestObject{
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:self.url];
    urlRequest.HTTPMethod = self.httpMethod;
    if(!self.httpMethod)
        self.httpMethod = @"GET";
    if(self.parametersDictionary)
        urlRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:self.parametersDictionary
                                                          options:0
                                                            error:nil];
    if(self.headerDictioanry){
        [self.headerDictioanry enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [urlRequest setValue:obj forHTTPHeaderField:key];
        }];
    }
    return urlRequest;
}

-(void)setNativeRequestObject:(NSMutableURLRequest *)nativeRequest{
    self.url = nativeRequest.URL;
    NSError *error;
    self.parametersDictionary = [NSJSONSerialization JSONObjectWithData:nativeRequest.HTTPBody
                                                                options:kNilOptions
                                                                  error:&error];
    self.httpMethod = nativeRequest.HTTPMethod;
    self.headerDictioanry = [nativeRequest allHTTPHeaderFields];
}

-(void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field{
    if(!self.headerDictioanry)
        self.headerDictioanry = [[NSDictionary alloc] init];
    [self.headerDictioanry setValue:value forKey:field];
}

@end

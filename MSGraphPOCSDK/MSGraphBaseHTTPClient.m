//
//  MSGraphBaseHTTPClient.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphBaseHTTPClient.h"

@implementation MSGraphBaseHTTPClient

-(instancetype)initWithAuthenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider baseUrl:(NSString *)baseUrl{
    self = [super init];
    if(self){
        _authenticationProvider = authenticationProvider;
        _baseUrl = baseUrl;
    }
    return self;
}

@end

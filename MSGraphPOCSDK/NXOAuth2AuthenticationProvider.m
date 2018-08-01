//
//  SnippetAuthenticationProvider.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 27/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "NXOAuth2AuthenticationProvider.h"
#import "MSAuthenticationProvider.h"

@interface NXOAuth2AuthenticationProvider()<MSAuthenticationProvider>

@end

@implementation NXOAuth2AuthenticationProvider

-(void)appendAuthenticationHeaders:(NSMutableURLRequest *)request completion:(MSAuthenticationCompletion)completionHandler{
    NSString *token = @"testToken";
    [request setValue:[@"Bearer " stringByAppendingString:token] forHTTPHeaderField:@"Authorization"];
    completionHandler(request,nil);
}

@end

//
//  MSGraphBaseHTTPClient.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSAuthenticationProvider.h"

/*
 Base class for HTTP Client.

 */

@interface MSGraphBaseHTTPClient : NSObject

@property (readonly) NSString *baseUrl;
@property (readonly) id<MSAuthenticationProvider> authenticationProvider;


/*
 Initializes and returns and instance of this class to handle the HTTP calls.

 @param authenticationProvider Instance of the class which implements the methods of MSAuthenticationProvider
 @param baseUrl Base URL of all the network calls which will be made my this client.
 */

-(instancetype)initWithAuthenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider baseUrl:(NSString *)baseUrl;

@end

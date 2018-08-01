//
//  MSGraphResponse.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A thin wrapper on top of native response and data object to facilitate the creation of Graph Specific response.
 */

@interface MSGraphResponse : NSObject

/*
 Initilizes and returns the MSGraphResponse object.
 @param response The native url response which will be used to determine the response header fields.
 @param data The native data object which contains the values returned from network call
 */
-(instancetype)initWithResponse:(NSURLResponse *)response
                           data:(NSData *)data;

/*
The function to get raw NSURLResopnse which was return from nework call.
 */
-(NSURLResponse *)getHTTPResponse;

/*
 The function to get raw NSData which was originally returned from network call.
 */
-(NSData *)getResponseData;

@end

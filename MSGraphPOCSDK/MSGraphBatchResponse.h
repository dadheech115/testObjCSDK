//
//  MSGraphBatchResponse.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 This class represents the response returned for a batch request
 */
@interface MSGraphBatchResponse : NSObject

/*
 Initilizes and returns the MSGraphBatchResponse object.
 @param response The native url response which will be used to determine the response header fields.
 @param data The native data object which contains the values returned from network call
 */

-(instancetype)initWithResponse:(NSURLResponse *)response
                           data:(NSData *)data;

/*
 The function to get raw NSURLResopnse which was returned from network call.
 */
-(NSURLResponse *)getHTTPResponse;

/*
 The function to get raw NSData which was originally returned from network call.
 */
-(NSData *)getResponseData;


@end

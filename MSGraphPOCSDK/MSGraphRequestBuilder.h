//
//  MSGraphRequestBuilder.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphObject.h"
#import "MSGraphRequest.h"
#import "MSGraphBatchRequest.h"

/*
 This class is responsible for creating MSGraphRequest object to be consumed by Graph Service Client.
 */

@interface MSGraphRequestBuilder : NSObject


/*
 Creates an MSGraphRequest instance.
 @param path The path which will be appended to Base URL to form the request URL
 @param graphObject The graph object which needs to be put in to the body of the request
 @param httpMethod The http method which needs to be performed for this request
 */
-(MSGraphRequest *)createRequestWithPath:(NSString *)path
                                  graphObject:(MSGraphObject *)graphObject
                              httpMethod:(NSString *)httpMethod;

/*
 Creates an MSGraphRequest instance.
 @param path The path which will be appended to Base URL to form the request URL
 @param paramsDictionary The dictionary which needs to be put in to the body of the request
 @param httpMethod The http method which needs to be performed for this request
 */
-(MSGraphRequest *)createRequestWithPath:(NSString *)path
                                  paramsDictionary:(NSDictionary *)paramsDictionary
                              httpMethod:(NSString *)httpMethod;


/*
 Creates an MSGraphBatchRequest instance
@param requests The list of request objects which needs to be merged to form one batch request
 */
-(MSGraphRequest *)createBatchRequestWithRequests:(NSMutableArray<MSGraphRequest *> *)requests;

@end

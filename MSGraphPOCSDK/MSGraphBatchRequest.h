//
//  MSGraphBatchRequest.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphRequest.h"

/*
 This class helps in creating instance of batch request
 */

@interface MSGraphBatchRequest : MSGraphRequest


/*
 Initializes and returns an instance of this class.
 @param requests Array of graph request which will be used to form the body of batch request
 */
-(instancetype)initWithRequests:(NSMutableArray<MSGraphRequest *> *)requests;

/*
 Adds a graph request to batch request
 @param request The instance of graph request which needs to be added to Batch Request
 */
-(void)addRequest:(MSGraphRequest *)request;

// Returns a dictionary representing the body of Batch Request;
-(NSDictionary *)getBatchRequestBody;

@end

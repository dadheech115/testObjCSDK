//
//  MSGraphResponseHandler.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphResponse.h"
#import "MSGraphObject.h"
#import "MSGraphBatchResponse.h"

//The completion handler of response parsing
typedef void (^MSGraphObjectCompletionHandler)(MSGraphObject *graphObject, NSError *error);

/*
 This class is responsible of parsing the response to MSGraphObject. If there is any error during the process whether its an error code in response or serilization, the same will also be returned;
 */


@interface MSGraphResponseHandler : NSObject

/*
 Generated the parsed object from response
 @param response The Graph Response object which needs to be parsed.
 @param class The model class derived from MSGraphObject, whose initilizer will be used to create parsed object
 @param handler The handler to be called upon completion of the response parsing.
 */
-(void)getParsedObjectFromResponse:(MSGraphResponse *)response toObjectOfClass:(Class)class withCompletionHandler:(MSGraphObjectCompletionHandler)handler;


/*
 Get an Array of MSGraphResponse by breaking a batch response
 @param response The batch response which needs to be converted into array of responses
 */
-(NSArray<MSGraphResponse *> *)getListFromBatchResponse:(MSGraphBatchResponse *)response;

@end

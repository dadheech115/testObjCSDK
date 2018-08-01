//
//  MSGraphServiceClient.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSAuthenticationProvider.h"
#import "MSGraphRequestBuilder.h"
#import "MSGraphResponseHandler.h"
#import "MSGraphRequest.h"
#import "MSGraphResponse.h"
#import "MSGraphBatchRequest.h"
#import "MSGraphBatchResponse.h"
//#import "MSGraphChunkedUploadTask.h"

@class MSGraphHTTPClient;

#define kHTTPGet @"GET"
#define kHTTPPost @"POST"
#define kHTTPPatch @"PATCH"
#define kHTTPPut @"PUT"
#define kHTTPDelete @"DELETE"


//Completion handler to be called when request finishes
typedef void (^MSGraphReqeustCompletionHandler)(MSGraphResponse *response, NSError *error);

//Completion handler to be called when batch Request finishes
typedef void (^MSGraphBatchRequestCompletionHandler)(MSGraphBatchResponse *response, NSError *error);


/*
This class deals with Graph Objects i.e. MSGraphRequest and MSGraphResponse

 */
@interface MSGraphServiceClient : NSObject


//Instance of http client 
@property (readonly) MSGraphHTTPClient *httpClient;

/*
 Initializes the Graph service client and internally stores a reference to Graph HTTP Client which is initialized with this authentication provider.

 @param authenticationProvider Instance which implmented the methods of MSAuthenticationProvider
 */

-(instancetype)initWithAuthenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider;


/*
 Initializes and returns an instance of request builder.
 */
-(MSGraphRequestBuilder *)createRequestBuilder;

/*
 Initializes and returns an instance of response handler.
 */
-(MSGraphResponseHandler *)createResponseHandler;



/*
 Starts the execution of Request and return the response in completion handler
 @param request The request object which needs to be executed
 @param handler The handler to be called once the execution finishes
 */
-(void)executeRequest:(MSGraphRequest *)request withCompletionHandler:(MSGraphReqeustCompletionHandler)handler;


/*
 Starts the execution of a Batch Request and return the response in completion handler
 @param request The batch request object which needs to be executed
 @param handler The handler to be called once the execution finishes
 */

-(void)executeBatchRequest:(MSGraphBatchRequest *)batchRequest withCompletionHandler:(MSGraphBatchRequestCompletionHandler)handler;

@end

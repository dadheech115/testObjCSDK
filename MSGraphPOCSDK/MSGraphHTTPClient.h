//
//  MSGraphHTTPClient.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphBaseHTTPClient.h"


//Completion handler to be called when request finishes
typedef void (^HTTPRequestCompletionHandler)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);


/*
    Derived class of Base HTTP Client which handled all the middlewares i.e. Authentication, Logging etc.
 */
@interface MSGraphHTTPClient : MSGraphBaseHTTPClient

/*
 Executes a native request object.
 @param request The request object which will be executed to perform the network call
 @param handler The completion handler which will be called on completion of this network call
 */

-(void)executeRequest:(NSURLRequest *)request withCompletionHandler:(HTTPRequestCompletionHandler)handler;

/*
 Executes a GET request.
 @param path The path which will be appended to Base URL to form the request URL
 @param handler The completion handler which will be called on completion of this network call
 */

-(void)getAsynchronouslyFromPath:(NSString *)path withCompletionHandler:(HTTPRequestCompletionHandler)handler;

/*
 Executes a POST request.
 @param path The path which will be appended to Base URL to form the request URL
 @param paramDictionary The dictionary containing the value which will form the body of Request
 @param handler The completion handler which will be called on completion of this network call
 */
-(void)postAsynchronouslyToPath:(NSString *)path requestBody:(NSDictionary *)paramDictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler;

/*
 Executes a PUT request.
 @param path The path which will be appended to Base URL to form the request URL
 @param paramDictionary The dictionary containing the value which will form the body of Request
 @param handler The completion handler which will be called on completion of this network call
 */
-(void)putAsynchronouslyAtPath:(NSString *)path requestBody:(NSDictionary *)paramDictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler;

/*
 Executes a PATCH request.
 @param path The path which will be appended to Base URL to form the request URL
 @param paramDictionary The dictionary containing the value which will form the body of Request
 @param handler The completion handler which will be called on completion of this network call
 */
-(void)patchAsynchronouslyAtPath:(NSString *)path requestBody:(NSDictionary *)paramDictionary withCompletionHandler:(HTTPRequestCompletionHandler)handler;

/*
 Executes a DELETE request.
 @param path The path which will be appended to Base URL to form the request URL
 @param handler The completion handler which will be called on completion of this network call
 */
-(void)deleteAsynchronouslyFromPath:(NSString *)path withCompletionHandler:(HTTPRequestCompletionHandler)handler;


@end

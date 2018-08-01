//
//  Snippet.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 27/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "Snippet.h"
#import "NXOAuth2AuthenticationProvider.h"
#import "MSGraphPOCSDK.h"
#import "MSGraphChunkedUploadTask.h"

@implementation Snippet


-(void)getMeGraphWay{
    NXOAuth2AuthenticationProvider *authenticationProvider = [NXOAuth2AuthenticationProvider new];

    //Initialize Graph Service Client with authentication provider
    MSGraphServiceClient *serviceClient = [[MSGraphServiceClient alloc] initWithAuthenticationProvider:authenticationProvider];

    // Get an instance of request builder to generate graph requests
    MSGraphRequestBuilder *requestBuilder = [serviceClient createRequestBuilder];

    //Get an instance of response handler to handle graph responses
    MSGraphResponseHandler *responseHandler = [serviceClient createResponseHandler];

    //Create a graph request using request builder
    MSGraphRequest *graphRequest = [requestBuilder createRequestWithPath:@"/me" graphObject:nil httpMethod:kHTTPGet];


    //Execute the graph request using graph service client's instance
    [serviceClient executeRequest:graphRequest withCompletionHandler:^(MSGraphResponse *response, NSError *error) {
        if(!error){
            [responseHandler getParsedObjectFromResponse:response toObjectOfClass:[MSGraphObject class] withCompletionHandler:^(MSGraphObject *graphObject, NSError *error) {
                if(!error){
                    NSLog(@"Parsed object - %@",graphObject);
                }
            }];
        }

    }];
}

-(void)getMeNativeWay{
    NXOAuth2AuthenticationProvider *authenticationProvider = [NXOAuth2AuthenticationProvider new];

    //Initialize Graph http client with authentication provider
    MSGraphHTTPClient *httpClient = [[MSGraphHTTPClient alloc] initWithAuthenticationProvider:authenticationProvider baseUrl:GraphBaseUrl];

    //Directly call GET method on Graph HTTP Client to asynchrnously get the data and url response
    [httpClient getAsynchronouslyFromPath:@"/me" withCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *headersDictionary = [(NSHTTPURLResponse *)response allHeaderFields];
        NSError *error1;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:kNilOptions
                                                                         error:&error1];
    }];
}

-(void)getMeHybridWay{
    NXOAuth2AuthenticationProvider *authenticationProvider = [NXOAuth2AuthenticationProvider new];

    //Initialize Graph Service Client with authentication provider
    MSGraphServiceClient *serviceClient = [[MSGraphServiceClient alloc] initWithAuthenticationProvider:authenticationProvider];

    // Get an instance of request builder to generate graph requests
    MSGraphRequestBuilder *requestBuilder = [serviceClient createRequestBuilder];

    MSGraphRequest *graphRequest = [requestBuilder createRequestWithPath:@"/me" graphObject:nil httpMethod:kHTTPGet];

    NSMutableURLRequest *urlReuest = [graphRequest getNativeRequestObject];
    [urlReuest setValue:@"Hybrid" forHTTPHeaderField:@"Approach-Type"];

    [serviceClient.httpClient executeRequest:urlReuest withCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *headersDictionary = [(NSHTTPURLResponse *)response allHeaderFields];
        NSError *error1;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:kNilOptions
                                                                         error:&error1];
    }];
}

-(void)createBatchRequest{

    NXOAuth2AuthenticationProvider *authenticationProvider = [NXOAuth2AuthenticationProvider new];

    //Initialize Graph Service Client with authentication provider
    MSGraphServiceClient *serviceClient = [[MSGraphServiceClient alloc] initWithAuthenticationProvider:authenticationProvider];

    // Get an instance of request builder to generate graph requests
    MSGraphRequestBuilder *requestBuilder = [serviceClient createRequestBuilder];

    //Get an instance of response handler to handle graph responses
    MSGraphResponseHandler *responseHandler = [serviceClient createResponseHandler];

    //Create multiple requests using request builder
    MSGraphRequest *meGraphRequest = [requestBuilder createRequestWithPath:@"/me"
                                                          paramsDictionary:nil
                                                                httpMethod:kHTTPGet];
    MSGraphRequest *messagesGraphRequest = [requestBuilder createRequestWithPath:@"/me/messages"
                                                           paramsDictionary:nil httpMethod:kHTTPGet];

    //Initlize MSGraphBatchRequest
    MSGraphBatchRequest *batchRequest = [requestBuilder createBatchRequestWithRequests:@[meGraphRequest,messagesGraphRequest]];

    MSGraphRequest *forwardMessageRequest = [requestBuilder createRequestWithPath:@"/me/messages/{message-id}/forward"
                                                                 graphObject:[MSGraphObject new]
                                                                       httpMethod:kHTTPPost];
    //Add more requests to batch
    [batchRequest addRequest:forwardMessageRequest];

    //Execute batch request on service client
    [serviceClient executeBatchRequest:batchRequest withCompletionHandler:^(MSGraphBatchResponse *response, NSError *error) {
        if(!error){
            NSArray *responseList = [responseHandler getListFromBatchResponse:response];
            for(MSGraphResponse *graphResponse in responseList){
                [responseHandler getParsedObjectFromResponse:graphResponse toObjectOfClass:[MSGraphObject class] withCompletionHandler:^(MSGraphObject *graphObject, NSError *error) {
                    if(!error){
                        NSLog(@"Parsed object - %@",graphObject);
                    }
                }];
            }
        }

    }];
}

-(void)uploadLargeFile{

    NXOAuth2AuthenticationProvider *authenticationProvider = [NXOAuth2AuthenticationProvider new];

    //Initialize Graph Service Client with authentication provider
    MSGraphServiceClient *serviceClient = [[MSGraphServiceClient alloc] initWithAuthenticationProvider:authenticationProvider];

    // Get an instance of request builder to generate graph requests
    MSGraphRequestBuilder *requestBuilder = [serviceClient createRequestBuilder];

    //Get an instance of response handler to handle graph responses
    MSGraphResponseHandler *responseHandler = [serviceClient createResponseHandler];

    //Create a chunked upload task
    MSGraphChunkedUploadTask *chunkedTask = [[MSGraphChunkedUploadTask alloc] initWithServiceClient:serviceClient];
    //Set parameters
    [chunkedTask setChunkSize:320*4];
    NSData *fileData = [NSData new];
    [chunkedTask setFileData:fileData];
    [chunkedTask createGraphUploadSessionForType:MSChunkedUploadTaskTypeOneDrive withCompletionHandler:^(NSURL *uploadUrl, NSError *error) {

        //After creation of upload url, developer can upload in two ways
        /*
         Dev can directly call the upload method to start uploading
         */
        [chunkedTask startChunkedUploadWithCompletionHandler:^(MSGraphResponse *response, NSError *error) {

        }];

        /*
         Or
         Dev can get the chunked requests and handle the execution of those requests himself
         */
        NSArray *chunkedRequests = [chunkedTask getChunkedRequests];
        for(MSGraphRequest *request in chunkedRequests){
            [chunkedTask.serviceClient executeRequest:request withCompletionHandler:^(MSGraphResponse *response, NSError *error) {
                
            }];
        }
    }];


}

@end


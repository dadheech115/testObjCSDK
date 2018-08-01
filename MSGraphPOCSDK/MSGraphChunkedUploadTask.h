//
//  MSGraphChunkedUploadTask.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphBaseTask.h"
#import "MSGraphResponse.h"

typedef NS_ENUM(NSInteger, MSChunkedUploadTaskType){
    MSChunkedUploadTaskTypeOneDrive
};

//Completion handler to be called when Chunked Upload Task finishes
typedef void (^MSGraphChunkedUploadTaskCompletionHandler)(MSGraphResponse *response, NSError *error);

/*
 This class helps in implmenting chunked upload feature for Graph
 */

@interface MSGraphChunkedUploadTask : MSGraphBaseTask

/*
 Sets the chunk size
 @param chunkSize - the preferred chunk size - should be in multiples of 320KB
 */
-(void)setChunkSize:(NSInteger)chunkSize;

/*
 Sets the file data to be uploaded
@param fileData - The data of file which needs to be uploaded
 */
-(void)setFileData:(NSData *)fileData;

/*
 Creates a upload session for chunked upload
 @param completionHandler Handler to be called with upload url when session creation is completed
 */
-(void)createGraphUploadSessionForType:(MSChunkedUploadTaskType)taskType withCompletionHandler:(void (^)(NSURL *uploadUrl, NSError *error))completionHandler;

// Returns an array of request object with proper ranges attached in url according to chunk size
-(NSArray *)getChunkedRequests;


/*
 Starts the execution of chunked requests
 @param completionHandler Handler to be called when Chunked Upload finishes.
 */

-(void)startChunkedUploadWithCompletionHandler:(MSGraphChunkedUploadTaskCompletionHandler)completionHandler;

@end

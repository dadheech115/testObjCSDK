//
//  MSGraphBatchTask.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphRequest.h"

@interface MSGraphBatchRequest : NSObject


-(instancetype)initWithRequests:(NSMutableArray<MSGraphRequest *> *)requests;

-(void)addRequest:(MSGraphRequest *)request;

-(NSDictionary *)getBatchRequestBody;

@end

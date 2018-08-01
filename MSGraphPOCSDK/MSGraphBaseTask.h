//
//  MSGraphBaseTask.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 30/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSGraphServiceClient.h"

//Base class for all the Graph specific tasks that will be developed
@interface MSGraphBaseTask : NSObject

@property (readonly) MSGraphServiceClient *serviceClient;

-(instancetype)initWithServiceClient:(MSGraphServiceClient *)serviceClient;

@end

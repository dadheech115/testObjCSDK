//
//  MSGraphResponseHandler.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphResponseHandler.h"

@implementation MSGraphResponseHandler

-(void)getParsedObjectFromResponse:(MSGraphResponse *)response toObjectOfClass:(Class)class withCompletionHandler:(MSGraphObjectCompletionHandler)handler{
    NSError *graphError = [self getGraphErrorFromResponse:[response getHTTPResponse]];
    if(graphError){
        handler(nil,graphError);
    }else{
        NSError *serializationError;
        NSData *responseData = [response getResponseData];
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&serializationError];
        if(serializationError)
            handler(nil,serializationError);
        else{
            MSGraphObject *resolvedObject = [(MSGraphObject *)[class alloc] initWithDictionary:responseDictionary];
            handler(resolvedObject, nil);
        }
    }
}

-(NSError *)getGraphErrorFromResponse:(NSURLResponse *)response{
    if([(NSHTTPURLResponse *)response statusCode] !=200)
        return [NSError new];
    else
        return nil;
}

-(NSArray<MSGraphResponse *> *)getListFromBatchResponse:(MSGraphBatchResponse *)response{
    NSMutableArray *temp = [NSMutableArray new];
    return temp;
    
}

@end

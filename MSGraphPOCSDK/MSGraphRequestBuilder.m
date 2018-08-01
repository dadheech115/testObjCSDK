//
//  MSGraphRequestBuilder.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphRequestBuilder.h"


@interface MSGraphRequestBuilder()

@property NSString *baseUrl;

@end

@implementation MSGraphRequestBuilder

-(instancetype)initWithBaseUrl:(NSString *)baseUrl{
    self = [super init];
    if(self){
        self.baseUrl = baseUrl;
    }
    return self;
}

-(MSGraphRequest *)createRequestWithPath:(NSString *)path graphObject:(MSGraphObject *)graphObject httpMethod:(NSString *)httpMethod{
    return [self createRequestWithPath:path paramsDictionary:[graphObject dictionaryFromItem] httpMethod:httpMethod];
}

-(MSGraphRequest *)createRequestWithPath:(NSString *)path paramsDictionary:(NSDictionary *)paramsDictionary httpMethod:(NSString *)httpMethod{
    MSGraphRequest *graphRequest = [[MSGraphRequest alloc] initWithURL:[NSURL URLWithString:[self.baseUrl stringByAppendingString:path]] parameters:paramsDictionary httpMethod:httpMethod];
    return graphRequest;
}


@end

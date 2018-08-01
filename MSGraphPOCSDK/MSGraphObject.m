//
//  MSGraphObject.m
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 26/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import "MSGraphObject.h"

@interface MSGraphObject()

@property NSDictionary *propertyDictionary;

@end

@implementation MSGraphObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.propertyDictionary = dictionary;
    }
    return self;
}

-(NSDictionary *)dictionaryFromItem{
    return self.propertyDictionary;
}

@end

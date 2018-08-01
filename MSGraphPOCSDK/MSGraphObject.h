//
//  MSGraphObject.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 26/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSGraphObject : NSObject

/**
 Creates an MSObject with the given dictionary.
 @param dictionary The dictionary representation of the object.
 @warning This method will return nil if the dictionary is nil.
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

/**
 Creates a dictionary from the given item.
 @return dictionary Representation for the given item.
 */
- (NSDictionary*)dictionaryFromItem;


@end

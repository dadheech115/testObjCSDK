//
//  MSGraphRequest.h
//  MSGraphPOCSDK
//
//  Created by Vikas Dadheech on 25/07/18.
//  Copyright © 2018 Vikas Dadheech. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 A thin wrapper on top of native request object to facilitate the creation of Graph Specific requests.
 */
@interface MSGraphRequest : NSObject


/*
 Initializes an MSGraphRequest instance.
 @param url The url of the request
 @param paramsDictionary The dictionary which needs to be put in the body of the request
 @param httpMethod The http method which needs to be performed for this request
 */
- (instancetype)initWithURL:(nonnull NSURL *)url
                 parameters:(NSDictionary *)paramsDictionary
                 httpMethod:(NSString *)httpMethod;

/*
 This method can be used to set any additional headers needed by developers.
 @param value The value of header field.
 @param field The name of header field.
 */
-(void)setValue:(nonnull NSString *)value forHTTPHeaderField:(nonnull NSString *)field;

/*
 This method can be used to get native request object
 */
-(NSMutableURLRequest *)getNativeRequestObject;

/*
 This method can be used to replace the original parameters of MSGraphRequest object with the properties of new NSMutableURLRequest object.
 @param nativeRequest The request object which will be processed to extract the new parameters.
 */
-(void)setNativeRequestObject:(NSMutableURLRequest *)nativeRequest;
@end

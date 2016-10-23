//
//  OCMapperHelper.h
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 23/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OCMapperHelperOptions){
  OCMapperHelperOptionsRecursiveMap = 1<<0,
};

@interface OCMapperHelper : NSObject

+(NSDictionary*) mapForOCMapper:(NSDictionary*)dict;
+(NSDictionary*) mapForOCMapper:(NSDictionary*)dict options:(OCMapperHelperOptions)options;
@end

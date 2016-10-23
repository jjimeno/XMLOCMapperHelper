//
//  OCMapperHelper.m
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 23/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import "OCMapperHelper.h"

@interface OCMapperHelper(private)
+(NSDictionary*) mapDictionary:(NSDictionary*) dic options:(OCMapperHelperOptions)options;
@end

@implementation OCMapperHelper

+(NSDictionary*) mapForOCMapper:(NSDictionary*)dict;
{
    return [self mapForOCMapper:dict options:0];
}
+(NSDictionary*) mapForOCMapper:(NSDictionary*)dict options:(OCMapperHelperOptions)options;
{
    NSMutableDictionary* retDict = [NSMutableDictionary dictionaryWithCapacity:dict.allKeys.count];
    for (NSString* key in dict.allKeys) {
        if ( [dict[key] isKindOfClass:[NSDictionary class]] ){
            NSDictionary* innerDict = dict[key];
            if ( [innerDict allValues].count == 1 && [innerDict.allKeys[0] isEqualToString:@"text"]){
                retDict[key]= innerDict.allValues[0];
            }else if (options & OCMapperHelperOptionsRecursiveMap ){
                retDict[key] = [self mapDictionary:dict[key] options:options];
            }
        }else{
            retDict[key] = dict[key];
        }
    }
    return [retDict mutableCopy];
}
@end


@implementation OCMapperHelper(private)
+(NSDictionary*) mapDictionary:(NSDictionary*) dict options:(OCMapperHelperOptions)options;
{
    NSMutableDictionary* retDict = [NSMutableDictionary dictionaryWithCapacity:dict.allKeys.count];
    for (NSString* key in dict.allKeys) {
        if ( [dict[key] isKindOfClass:[NSDictionary class]] ){
            NSDictionary* innerDict = dict[key];
            if ( [innerDict allValues].count == 1 && [innerDict.allKeys[0] isEqualToString:@"text"]){
                retDict[key]= innerDict.allValues[0];
            }else if (options & OCMapperHelperOptionsRecursiveMap ){
                retDict[key] = [self mapDictionary:dict[key] options:options];
            }
        }else if ([dict[key] isKindOfClass:[NSArray class ]]){
            NSArray* arr = (NSArray*)dict[key];
            NSMutableArray* modArr = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSUInteger x=0; x<arr.count; x++) {
                modArr[x] = [self mapDictionary:arr[x] options:options];
            }
            retDict[key] = [NSArray arrayWithArray:modArr ].mutableCopy;
        }else{
            retDict[key] = dict[key];
        }
    }
    return [retDict mutableCopy];
}


@end

//
//  BreakfastFood.h
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 27/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BreakfastFood : NSObject
@property ( nonatomic, strong ) NSString* name;
@property ( nonatomic, strong ) NSString* desc;
@property ( nonatomic ) NSInteger calories;
@property ( nonatomic, strong ) NSString* price;
@end

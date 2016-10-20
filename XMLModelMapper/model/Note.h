//
//  Note.h
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 20/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
//<script/>
//<to>Tove</to>
//<from>Jani</from>
//<heading>Reminder</heading>
//<body>Don't forget me this weekend!</body>

@property (nonatomic, strong) NSString* to;
@property (nonatomic, strong) NSString* from;
@property (nonatomic, strong) NSString* heading;
@property (nonatomic, strong) NSString* body;

@end

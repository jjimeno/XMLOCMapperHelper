//
//  CD.h
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 23/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDModel : NSObject
//<TITLE>Empire Burlesque</TITLE>
//<ARTIST>Bob Dylan</ARTIST>
//<COUNTRY>USA</COUNTRY>
//<COMPANY>Columbia</COMPANY>
//<PRICE>10.90</PRICE>
//<YEAR>1985</YEAR>

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* artist;
@property (nonatomic, strong) NSString* country;
@property (nonatomic, strong) NSString* company;
@property (nonatomic )        float price;
@property (nonatomic )        NSInteger year;

@end

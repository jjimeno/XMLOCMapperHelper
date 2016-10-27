//
//  BreakfastFoodMapperTest.m
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 27/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BreakfastFood.h"
#import "OCMapperHelper.h"
#import "XMLReader.h"
#import "OCMapper.h"

@interface BreakfastFoodMapperTest : XCTestCase

@end

@implementation BreakfastFoodMapperTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    InCodeMappingProvider* mappingProvider = [InCodeMappingProvider new];
    [mappingProvider mapFromDictionaryKey:@"description" toPropertyKey:@"desc" forClass:[BreakfastFood class ]];
    [ObjectMapper sharedInstance ].mappingProvider = mappingProvider;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(NSString*) provideBreakfast
{
    NSString* str = @"<breakfast_menu> \
    <script/> \
    <food> \
    <name>Belgian Waffles</name> \
    <price>$5.95</price> \
    <description> \
    Two of our famous Belgian Waffles with plenty of real maple syrup \
    </description> \
    <calories>650</calories> \
    </food> \
    <food> \
    <name>Strawberry Belgian Waffles</name> \
    <price>$7.95</price> \
    <description> \
    Light Belgian waffles covered with strawberries and whipped cream \
    </description> \
    <calories>900</calories> \
    </food> \
    <food> \
    <name>Berry-Berry Belgian Waffles</name> \
    <price>$8.95</price> \
    <description> \
    Light Belgian waffles covered with an assortment of fresh berries and whipped cream \
    </description> \
    <calories>900</calories> \
    </food> \
    <food> \
    <name>French Toast</name> \
    <price>$4.50</price> \
    <description> \
    Thick slices made from our homemade sourdough bread \
    </description> \
    <calories>600</calories> \
    </food> \
    <food> \
    <name>Homestyle Breakfast</name> \
    <price>$6.95</price> \
    <description> \
    Two eggs, bacon or sausage, toast, and our ever-popular hash browns \
    </description> \
    <calories>950</calories> \
    </food> \
    </breakfast_menu>";
    return str;
}

- (void)testBreakfastModelMapper{
    NSError* error = nil;
    NSDictionary* dict = [XMLReader dictionaryForXMLString:[self provideBreakfast] options:0 error:&error];
    dict = [OCMapperHelper mapForOCMapper:dict options:OCMapperHelperOptionsRecursiveMap];
    XCTAssertNil(error);
    XCTAssertNotNil(dict);
    
    NSArray<BreakfastFood*> *food = [BreakfastFood objectFromDictionary:dict[@"breakfast_menu"][@"food"] ];
    XCTAssertNotNil(food);
    XCTAssertEqual(5, food.count);
    
    XCTAssertTrue([@"French Toast" isEqualToString: food[3].name]);
    XCTAssertTrue([@"$4.50" isEqualToString: food[3].price]);
    XCTAssertTrue([@"Thick slices made from our homemade sourdough bread" isEqualToString: food[3].desc]);
    XCTAssertEqual(600, food[3].calories);
}

@end

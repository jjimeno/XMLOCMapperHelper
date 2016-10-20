//
//  XMLModelMapperTests.m
//  XMLModelMapperTests
//
//  Created by Jose Jimeno Linares on 20/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMapper.h"
#import "Note.h"
#import "XMLReader.h"

@interface XMLModelMapperTests : XCTestCase

@end

@implementation XMLModelMapperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(NSData*)provideData
{
    NSString* xmlStr = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\
    <script/> \
    <to>Tove</to> \
    <from>Jani</from> \
    <heading>Reminder</heading> \
    <body>Don't forget me this weekend!</body>";
    return [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParse {
    NSError* error = nil;
    NSDictionary* dict = [XMLReader dictionaryForXMLData:[self provideData] error:&error];
    XCTAssertNil(error);
    XCTAssertNotNil(dict);
    Note* note = [Note objectFromDictionary: dict];

    XCTAssertEqual(@"Tove", note.to);
    XCTAssertEqual(@"Jani", note.from);
    XCTAssertEqual(@"Reminder", note.heading);
    XCTAssertEqual(@"Don't forget me this weekend!", note.body);
    
}


@end

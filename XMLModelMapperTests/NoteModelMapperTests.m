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
#import "OCMapperHelper.h"

@interface NoteModelMapperTests : XCTestCase

@end

@implementation NoteModelMapperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(NSString*)provideNoteXML
{
    NSString* xmlStr = @"<note>\
    <to>Tove</to>\
    <from>Jani</from>\
    <heading>Reminder</heading>\
    <body>Don't forget me this weekend!</body>\
    </note>";
    return xmlStr;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseNote {
    NSError* error = nil;
    NSDictionary* dict = [XMLReader dictionaryForXMLString:[self provideNoteXML] options:0 error:&error];
    dict = [OCMapperHelper mapForOCMapper:dict options:OCMapperHelperOptionsRecursiveMap];
    XCTAssertNil(error); 
    XCTAssertNotNil(dict);
    Note* note = [Note objectFromDictionary: dict[@"note"]];

    XCTAssertTrue([@"Tove" isEqualToString: note.to]);
    XCTAssertTrue([@"Jani" isEqualToString: note.from]);
    XCTAssertTrue([@"Reminder" isEqualToString: note.heading]);
    XCTAssertTrue([@"Don't forget me this weekend!" isEqualToString: note.body]);
}


@end

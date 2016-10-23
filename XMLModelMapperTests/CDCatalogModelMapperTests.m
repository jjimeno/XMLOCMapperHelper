//
//  CDCatalogModelMapperTests.m
//  XMLModelMapper
//
//  Created by Jose Jimeno Linares on 23/10/16.
//  Copyright © 2016 JJL. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XMLReader.h"
#import "OCMapperHelper.h"
#import "CDModel.h"
#import "OCMapper.h"

@interface CDCatalogModelMapperTests : XCTestCase

@end

@implementation CDCatalogModelMapperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCatalogParse {

    NSError* error = nil;
    NSDictionary* dict = [XMLReader dictionaryForXMLString:[self provideCatalog] options:0 error:&error];
    dict = [OCMapperHelper mapForOCMapper:dict options:OCMapperHelperOptionsRecursiveMap];
    XCTAssertNil(error);
    XCTAssertNotNil(dict);
    NSArray<CDModel*>* catalog = [CDModel objectFromDictionary: dict[@"CATALOG"][@"CD"]];
    
    XCTAssertNotNil(catalog);
    XCTAssertEqual(5, catalog.count);
    
    XCTAssertTrue([@"Empire Burlesque" isEqualToString: catalog[0].title]);
    XCTAssertTrue([@"Bonnie Tyler" isEqualToString: catalog[1].artist]);
    XCTAssertTrue([@"USA" isEqualToString: catalog[2].country]);
    XCTAssertTrue([@"Virgin records" isEqualToString: catalog[3].company]);
    XCTAssertEqualWithAccuracy(10.20, catalog[3].price, 0.1f);
    XCTAssertEqual(1997, catalog[4].year);

}


-(NSString*) provideCatalog
{
    NSString* catalog = @"<CATALOG> \
    <script/> \
    <CD> \
    <TITLE>Empire Burlesque</TITLE> \
    <ARTIST>Bob Dylan</ARTIST> \
    <COUNTRY>USA</COUNTRY> \
    <COMPANY>Columbia</COMPANY> \
    <PRICE>10.90</PRICE> \
    <YEAR>1985</YEAR> \
    </CD> \
    <CD> \
    <TITLE>Hide your heart</TITLE> \
    <ARTIST>Bonnie Tyler</ARTIST> \
    <COUNTRY>UK</COUNTRY> \
    <COMPANY>CBS Records</COMPANY> \
    <PRICE>9.90</PRICE> \
    <YEAR>1988</YEAR> \
    </CD> \
    <CD> \
    <TITLE>Greatest Hits</TITLE> \
    <ARTIST>Dolly Parton</ARTIST> \
    <COUNTRY>USA</COUNTRY> \
    <COMPANY>RCA</COMPANY> \
    <PRICE>9.90</PRICE> \
    <YEAR>1982</YEAR> \
    </CD> \
    <CD> \
    <TITLE>Still got the blues</TITLE> \
    <ARTIST>Gary Moore</ARTIST> \
    <COUNTRY>UK</COUNTRY> \
    <COMPANY>Virgin records</COMPANY> \
    <PRICE>10.20</PRICE> \
    <YEAR>1990</YEAR> \
    </CD> \
    <CD> \
    <TITLE>Eros</TITLE> \
    <ARTIST>Eros Ramazzotti</ARTIST> \
    <COUNTRY>EU</COUNTRY> \
    <COMPANY>BMG</COMPANY> \
    <PRICE>9.90</PRICE> \
    <YEAR>1997</YEAR> \
    </CD> \
    </CATALOG>";
    return catalog;
}


@end

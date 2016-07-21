//
//  StockQuoteTests.m
//  StockQuoteTests
//
//  Created by Romal on 7/20/16.
//  Copyright © 2016 Romal Shah. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface StockQuoteTests : XCTestCase

@end

@implementation StockQuoteTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testServiceURL {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Get JSON data"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.google.com/finance/info?q=GM"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        XCTAssertNotNil(data);
        XCTAssertNil(error);
        NSRange range = NSMakeRange(4, [data length] - 5);
        NSData *refinedData = [data subdataWithRange:range];
        XCTAssertNotNil(refinedData);
        NSJSONSerialization *jsonSerialization = [NSJSONSerialization JSONObjectWithData:refinedData options:0 error:nil];
        XCTAssertNotNil(jsonSerialization);
        
        [expectation fulfill];
    }];
    
    [dataTask resume];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

@end

//
//  HHLocalizedStringWithKeyTests.m
//  HHLocalizedStringWithKeyTests
//
//  Created by Hyuk Hur on 11/10/14.
//  Copyright (c) 2014 Hyuk Hur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface HHLocalizedStringWithKeyTests : XCTestCase

@end

@implementation HHLocalizedStringWithKeyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//"Localized Key" = "Localized Value in NSLocalizedString";
- (void)testExample {
    NSString *key = @"Localized Key";
    NSString *value = NSLocalizedString(key, nil);
    XCTAssertNotEqual(key, value);
    XCTAssertNotEqualObjects(key, value);
    XCTAssertFalse([value containsString:key]);
    XCTAssertTrue([[value description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString", value);
}

- (void)_testStringWithFormat {
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    NSString *formatedString = [NSString stringWithFormat:value, @"test"];
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    XCTAssertTrue([[formatedString description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", value);
}
@end

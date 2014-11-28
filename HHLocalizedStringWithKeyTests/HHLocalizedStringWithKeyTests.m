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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:value];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString", value);
}

- (void)testInitWithString
{
    NSString *key = @"Localized Key";
    NSString *value = [[NSString alloc] initWithString:NSLocalizedString(key, nil)];
    XCTAssertNotEqual(key, value);
    XCTAssertNotEqualObjects(key, value);
    XCTAssertFalse([value containsString:key]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:value];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString", value);
}

- (void)testInitWithFormat
{
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    NSString *formatedString = [[NSString alloc] initWithFormat:value, @"test"];
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

- (void)testInitWithFormatArguments
{
    [self initWithFormatArguments:@"fake ID", @"test"];
}

- (void)initWithFormatArguments:(NSString *)fakeID, ...
{
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    va_list argList;
    va_start(argList, fakeID);
    NSString *formatedString = [[NSString alloc] initWithFormat:value arguments:argList];
    va_end(argList);
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

- (void)testInitWithFormatLocale
{
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    NSString *formatedString = [[NSString alloc] initWithFormat:value locale:[NSLocale currentLocale], @"test"];
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

- (void)testInitWithFormatLocaleArguments
{
    [self initWithFormatLocaleArguments:@"fake ID", @"test"];
}

- (void)initWithFormatLocaleArguments:(NSString *)fakeID, ...
{
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    va_list argList;
    va_start(argList, fakeID);
    NSString *formatedString = [[NSString alloc] initWithFormat:value locale:[NSLocale currentLocale] arguments:argList];
    va_end(argList);
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

- (void)testStringWithFormat
{
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    NSString *formatedString = [NSString stringWithFormat:value, @"test"];
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

- (void)testStringWithString
{
    NSString *key = @"Localized Key";
    NSString *value = [NSString stringWithString:NSLocalizedString(key, nil)];
    XCTAssertNotEqual(key, value);
    XCTAssertNotEqualObjects(key, value);
    XCTAssertFalse([value containsString:key]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:value];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString", value);
}

- (void)testLocalizedStringWithFormat
{
//    NSLocale *local = [NSLocale currentLocale];
    NSString *key = @"Localized Key %@";
    NSString *value = NSLocalizedString(key, nil);
    NSString *formatedString = [NSString localizedStringWithFormat:value, @"test"];
    
    NSString *tmp = [NSString stringWithFormat:key, @"test"];
    XCTAssertNotEqualObjects(tmp, formatedString);
    XCTAssertFalse([formatedString containsString:key]);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:formatedString];
    XCTAssertTrue([[label description] containsString:key]);
    XCTAssertEqualObjects(@"Localized Value in NSLocalizedString with test", formatedString);
}

//- (NSString *)stringByAppendingString:(NSString *)aString;
//- (NSString *)stringByAppendingFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);


@end

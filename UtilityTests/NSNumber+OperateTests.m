//
//  NSNumber+OperateTests.m
//  Utility
//
//  Created by xsl on 2017/5/16.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+Operate.h"

@interface NSNumber_OperateTests : XCTestCase

@end

@implementation NSNumber_OperateTests

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

/** 金额千分制（带两位小数）-->0.00 */
- (void)testAmountValue{
    // 正数
    XCTAssertEqualObjects(@(5238.00).amountValue, @"5,238.00");
    XCTAssertEqualObjects(@(5238).amountValue, @"5,238.00");
    XCTAssertEqualObjects(@(5238.2).amountValue, @"5,238.20");
    XCTAssertEqualObjects(@(5238.20).amountValue, @"5,238.20");
    XCTAssertEqualObjects(@(5238.25).amountValue, @"5,238.25");
    XCTAssertEqualObjects(@(5238.2549).amountValue, @"5,238.25");
    XCTAssertEqualObjects(@(5238.2550).amountValue, @"5,238.26");// 进位
    XCTAssertEqualObjects(@(0.20).amountValue, @"0.20");
    XCTAssertEqualObjects(@(0).amountValue, @"0.00");
    
    // 负数
    XCTAssertEqualObjects(@(-5238.00).amountValue, @"-5,238.00");
    XCTAssertEqualObjects(@(-5238).amountValue, @"-5,238.00");
    XCTAssertEqualObjects(@(-5238.2).amountValue, @"-5,238.20");
    XCTAssertEqualObjects(@(-5238.20).amountValue, @"-5,238.20");
    XCTAssertEqualObjects(@(-5238.25).amountValue, @"-5,238.25");
    XCTAssertEqualObjects(@(-5238.2549).amountValue, @"-5,238.25");
    XCTAssertEqualObjects(@(-5238.2550).amountValue, @"-5,238.26");// 进位
    XCTAssertEqualObjects(@(-0.20).amountValue, @"-0.20");
}

/** 数量千分制 */
- (void)testQuantityValue{
//    XCTAssertEqualObjects(@(5238.40).quantityValue, @"5,238.40");
    XCTAssertEqualObjects(@(5238).quantityValue, @"5,238");
//    XCTAssertEqualObjects(@(5238.00).quantityValue, @"5,238.00");
//    XCTAssertEqualObjects(@(5238.4036).quantityValue, @"5,238.4036");
    XCTAssertEqualObjects(@(0).quantityValue, @"0");
//    XCTAssertEqualObjects(@(0.20).quantityValue, @"0.20");
    
    // 负数
//    XCTAssertEqualObjects(@(-5238.40).quantityValue, @"-5,238.40");
    XCTAssertEqualObjects(@(-5238).quantityValue, @"-5,238");
//    XCTAssertEqualObjects(@(-5238.00).quantityValue, @"-5,238.00");
//    XCTAssertEqualObjects(@(-5238.4036).quantityValue, @"-5,238.4036");
//    XCTAssertEqualObjects(@(-0.20).quantityValue, @"-0.20");
}

/** 单位:万 (千分制)(金额) -->0.00 */
- (void)testWanValue{
    XCTAssertEqualObjects(@(15238.00).wanValue, @"1.52");
    XCTAssertEqualObjects(@(15258.00).wanValue, @"1.53");
    XCTAssertEqualObjects(@(10000.00).wanValue, @"1.00");
    XCTAssertEqualObjects(@(11000.00).wanValue, @"1.10");
    XCTAssertEqualObjects(@(11100.00).wanValue, @"1.11");
    XCTAssertEqualObjects(@(0.20).wanValue, @"0.20");
    XCTAssertEqualObjects(@(0.2340).wanValue, @"0.23");
    XCTAssertEqualObjects(@(0.2350).wanValue, @"0.24");
    
    XCTAssertEqualObjects(@(-15238.00).wanValue, @"-1.52");
    XCTAssertEqualObjects(@(-15258.00).wanValue, @"-1.53");
    XCTAssertEqualObjects(@(-10000.00).wanValue, @"-1.00");
    XCTAssertEqualObjects(@(-11000.00).wanValue, @"-1.10");
    XCTAssertEqualObjects(@(-11100.00).wanValue, @"-1.11");
    XCTAssertEqualObjects(@(-0.20).wanValue, @"-0.20");
    XCTAssertEqualObjects(@(-0.2340).wanValue, @"-0.23");
    XCTAssertEqualObjects(@(-0.2350).wanValue, @"-0.24");
}

/** 百分比数 */
- (void)testRateValue{
    XCTAssertEqualObjects(@(1).rateValue, @"100");
    XCTAssertEqualObjects(@(0).rateValue, @"0");
    XCTAssertEqualObjects(@(400).rateValue, @"40000");
    XCTAssertEqualObjects(@(1.2345).rateValue, @"123.45");
    XCTAssertEqualObjects(@(1.23455).rateValue, @"123.46");
    XCTAssertEqualObjects(@(1.23454).rateValue, @"123.45");
    XCTAssertEqualObjects(@(0.00455).rateValue, @"0.46");
    XCTAssertEqualObjects(@(0.00454).rateValue, @"0.45");
}

/** 大于10000 */
- (void)testOverWan{
    XCTAssertTrue(@(10000.00).overWan);
    XCTAssertTrue(@(-10000.00).overWan);
    XCTAssertFalse(@(0.00).overWan);
}

/** 是否为负数 **/
- (void)testIsNegative{
    XCTAssertTrue(@(-1).isNegative);
    XCTAssertFalse(@(0).isNegative);
    XCTAssertFalse(@(1).isNegative);
}

/** 是否大于0 **/
- (void)testOverZero{
    XCTAssertFalse(@(-1).overZero);
    XCTAssertFalse(@(0).overZero);
    XCTAssertTrue(@(1).overZero);
}

@end

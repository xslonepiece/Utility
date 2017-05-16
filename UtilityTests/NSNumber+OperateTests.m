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
    XCTAssertEqualObjects(@(173645238.00).amountValue, @"173,645,238.00");
    XCTAssertEqualObjects(@(173645238.20).amountValue, @"173,645,238.20");
    XCTAssertEqualObjects(@(173645238.25).amountValue, @"173,645,238.25");
    XCTAssertEqualObjects(@(173645238.2549).amountValue, @"173,645,238.25");
    XCTAssertEqualObjects(@(173645238.2550).amountValue, @"173,645,238.26");// 进位
    XCTAssertEqualObjects(@(0.20).amountValue, @"0.20");

}

/** 数量千分制 */
- (void)testQuantityValue{
    
}

/** 单位:万 (千分制)(金额) -->0.00 */
- (void)testWanValue{
    
}

/** 百分比数 */
- (void)testRateValue{
    
}

/** 大于10000 */
- (void)testOverWan{
    
}

/** 是否为负数 **/
- (void)testIsNegative{
    
}

/** 是否大于0 **/
- (void)testOverZero{
    
}

@end

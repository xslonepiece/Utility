//
//  NSString+MD5Test.m
//  Utility
//
//  Created by xsl on 2017/5/26.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MD5.h"

@interface NSString_MD5Test : XCTestCase

@end

@implementation NSString_MD5Test

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

- (void)testKD_MD5{
    NSString *str1 = @"test";
    NSString *str2 = nil;
    NSString *testStr1 = [NSString stringWithFormat:@"%@%@%@",str1,str2,str1];
    NSString *testStr2 = [NSString stringWithFormat:@"%@%@%@",str1,str1,str2];
    NSString *testStr3 = [NSString stringWithFormat:@"%@%@%@",str2,str1,str2];
    NSString *testStr4 = [NSString stringWithFormat:@"%@%@%@",str2,str2,str2];
    NSString *testStr5 = [NSString stringWithFormat:@"%@%@%@",str2,str2,str2];

    XCTAssertNil(testStr1.kd_md5Sting);
    XCTAssertNil(testStr2.kd_md5Sting);
    XCTAssertNil(testStr3.kd_md5Sting);
    XCTAssertNil(testStr4.kd_md5Sting);
    XCTAssertNil(testStr5.kd_md5Sting);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

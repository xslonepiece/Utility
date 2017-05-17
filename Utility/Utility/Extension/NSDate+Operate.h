//
//  NSDate+Operate.h
//  kdweibo
//
//  Created by  onepiece on 2017/4/26.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,TimePeriod){
    TimePeriodWeek,   // 周
    TimePeriodMonth,  // 月
    TimePeriodDay,    // 日
    TimePeriodYear,   // 年
    TimePeriodQuarter // 季度
};

@interface NSDate (Operate)

/**
 *  获取周期范围
 *  @param  timePeriod      周期，TimePeriod类型
 *  @param  fmt             日期格式化string
 *
 *  @return 格式化后的@[开始时间、结束时间]
 **/
+ (NSArray *)dateRangeWithTimePeriod:(TimePeriod)timePeriod fmt:(NSString *)fmt;

/**
 *  获取周期范围,fmt:yyyy-MM-dd
 *  @param  timePeriod      周期，TimePeriod类型
 *
 *  @return 格式化后的@[开始时间、结束时间]
 **/
+(NSArray *)dateRangeWithTimePeriod:(TimePeriod)timePeriod;

@end

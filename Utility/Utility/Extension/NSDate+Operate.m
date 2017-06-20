//
//  NSDate+Operate.m
//  kdweibo
//
//  Created by  onepiece on 2017/4/26.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import "NSDate+Operate.h"

@implementation NSDate (Operate)

+ (NSArray *)dateRangeWithTimePeriod:(TimePeriod)timePeriod{
    return [self dateRangeWithTimePeriod:timePeriod fmt:@"yyyy-MM-dd"];
}

+ (NSArray *)dateRangeWithTimePeriod:(TimePeriod)timePeriod fmt:(NSString *)fmt{
    double interval = 0.0;
    NSDate *tempDate = [NSDate date];
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = NO;
    switch (timePeriod) {
        case TimePeriodDay:{
            ok = [calendar rangeOfUnit:NSCalendarUnitDay startDate:&beginDate interval:&interval forDate:tempDate];
            break;
        }
        case TimePeriodWeek:{
            ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&beginDate interval:&interval forDate:tempDate];
            break;
        }
        case TimePeriodMonth:{
            ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:tempDate];
            break;
        }
        case TimePeriodQuarter:{
            ok = [calendar rangeOfUnit:NSCalendarUnitQuarter startDate:&beginDate interval:&interval forDate:tempDate];
            break;
        }
        case TimePeriodYear:{
            ok = [calendar rangeOfUnit:NSCalendarUnitYear startDate:&beginDate interval:&interval forDate:tempDate];
            break;
        }
        default:
            break;
    }
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return nil;
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];//NSDateFormatter 的默认时区是@"Asia/Shanghai"
    [myDateFormatter setDateFormat:fmt];
    NSString *beginString = [myDateFormatter stringFromDate:beginDate];
    NSString *endString = [myDateFormatter stringFromDate:endDate];
    return @[beginString,endString];
}

@end

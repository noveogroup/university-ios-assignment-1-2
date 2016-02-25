//
//  NSDate+Utilities.m
//  University
//
//  Created by eligat on 2/25/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days{
    return [[NSDate date] dateByAddingDays:days];
}

- (NSDate *)dateByAddingDays:(NSInteger)days{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

@end

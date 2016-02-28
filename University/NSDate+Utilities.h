//
//  NSDate+Utilities.h
//  University
//
//  Created by eligat on 2/25/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilities)
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
- (NSDate *)dateByAddingDays:(NSInteger)days;
@end

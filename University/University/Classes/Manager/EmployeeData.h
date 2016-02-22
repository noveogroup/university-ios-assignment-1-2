//
//  EmployeeData.h
//  University
//
//  Created by Vik on 18.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UniversityEmployee.h"
@class University;




@interface EmployeeData : NSObject
@property (copy, nonatomic) NSArray *employees;
@property (strong, nonatomic) University *university;

+ (instancetype)sharedInstance;

- (void)addObj:(id<UniversityEmployee>)obj;
- (void)observing;
- (void)reset;

@end



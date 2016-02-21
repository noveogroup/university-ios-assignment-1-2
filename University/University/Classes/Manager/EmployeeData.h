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
@class Human;


@protocol EmployeeDataDelegate;

@interface EmployeeData : NSObject
@property (weak, nonatomic) id <EmployeeDataDelegate> delegate;
@property (copy, nonatomic) NSArray *subjects;


+ (instancetype)sharedInstance;
- (void)addObj:(Human *)obj;
- (void)changeGPAWithIndex:(CGFloat)index withIdentifier:(NSString *)identifier;


- (void)clear;

@end


@protocol EmployeeDataDelegate <NSObject>


@end


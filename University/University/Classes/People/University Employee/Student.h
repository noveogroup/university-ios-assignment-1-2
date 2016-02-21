//
//  Student.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Human.h"
#import "UniversityEmployee.h"
@class EmployeeData;

@interface Student : Human <UniversityEmployee, EmployeeDataDelegate>

@property (assign, nonatomic) CGFloat GPA;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) EmployeeData *eData;
@property (strong, nonatomic) NSString *departmentName;
@property (strong, nonatomic) NSArray *subordinates;


- (CGFloat)changeGPAtoNewGPA:(CGFloat)newGPA withIdentifier:(NSString *)identifier;
- (CGFloat)randomGPA;



@end

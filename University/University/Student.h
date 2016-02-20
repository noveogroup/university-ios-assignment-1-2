//
//  Student.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Human.h"
#import "UniversityEmployee.h"
#import <UIKit/UIKit.h>
#include "EmployeeData.h"

@interface Student : Human <UniversityEmployee, EmployeeDataDelegate>

@property (assign, nonatomic) CGFloat GPA;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) EmployeeData *eData;
@property (strong, nonatomic) NSString *departmentName;
@property (strong, nonatomic) NSMutableArray *subordinates;


- (CGFloat)changeGPAtoNewGPA:(CGFloat)newGPA withIdentifier:(NSString *)identifier;
- (CGFloat)randomGPA;



@end

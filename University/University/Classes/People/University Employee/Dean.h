//
//  Dean.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Human.h"
#import "UniversityEmployee.h"
@class EmployeeData;



@interface Dean : Human <UniversityEmployee, EmployeeDataDelegate>

@property (copy, nonatomic) NSArray *subordinates;
@property (assign, nonatomic) NSInteger salary;
@property (copy, nonatomic) NSString *type;
@property (strong, nonatomic) EmployeeData *eData;



@end

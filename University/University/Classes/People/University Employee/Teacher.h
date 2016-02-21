//
//  Teacher.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Human.h"
#import "UniversityEmployee.h"
#include "EmployeeData.h"


@interface Teacher : Human <UniversityEmployee, EmployeeDataDelegate>

@property (strong, nonatomic) NSArray *subordinates;
@property (assign, nonatomic) NSInteger salary;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) EmployeeData *eData;



@end

//
//  EmployeeData.m
//  University
//
//  Created by Vik on 18.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "EmployeeData.h"
#import "Student.h"
#import "Dean.h"
#import "DepartmentHead.h"
#import "Teacher.h"
#import "UniversityEmployee.h"

@implementation EmployeeData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subjects = [NSArray array];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static EmployeeData *employeeData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        employeeData = [[EmployeeData alloc] init];
    });
    
    return employeeData;
}

- (void)addObj:(id <UniversityEmployee>)obj {
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:obj];
    self.subjects = [tempArray copy];
}

- (void)clear {
    self.subjects = [NSArray array];
}

- (void)changeGPAWithIndex:(CGFloat)index withIdentifier:(NSString *)identifier {
    for (Student *obj in self.subjects) {
        if ([obj isKindOfClass:[Student class]] && [obj.departmentName isEqualToString:identifier]) {
            obj.GPA *= index;
        }
    }
    
}


@end

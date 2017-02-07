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
#import "Human.h"
#import "University.h"

@implementation EmployeeData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.employees = [NSArray array];
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

- (void)addObj:(id<UniversityEmployee>)obj {
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:obj];
    self.employees = [self.employees arrayByAddingObjectsFromArray:[tempArray copy]];
}

- (void)reset {
    self.employees = [NSArray array];
    self.university = nil;
}


#pragma mark - Observing

- (void)observing {
    for (Student *student in self.employees) {
        [student addObserver:self
                  forKeyPath:@"GPA"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:nil];
        
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    
    Student *student = (Student *)object;
    NSArray *array = [self.university getStudentsOfDepartmentFromStudent:student];
    float value = 0.f;
    
    for (Student *st in array) {
        value += st.GPA;
    }
    
    float overallGPA = value / [array count];
    NSLog(@"Overall GPA of Department: %.2f",overallGPA);
    
}

@end

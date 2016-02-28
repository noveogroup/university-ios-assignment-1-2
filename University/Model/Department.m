//
//  Department.m
//  University
//
//  Created by Oleg Sannikov on 2/21/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "Department.h"
#import "DepartmentChief.h"
#import "UniversityEmployee.h"
#import "Teacher.h"

static void * TeachersKVOContext = &TeachersKVOContext;

@interface Department (){
    NSMutableSet<UniversityEmployee *> *_employees;
    NSMutableSet<Teacher *> *_teachers;
}
@property (nonatomic, readwrite) float meanGrade;

@end

@implementation Department
#pragma mark - Lifecycle
- (instancetype)init{
    self = [self init];
    if (self) {
    }
    
    return self;
}

+ (instancetype)departmentWithName:(NSString *)name{
    return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        _name = name;
        _employees = [NSMutableSet new];
        _teachers = [NSMutableSet new];
    }
    
    return self;
}


#pragma mark - Accessors
- (NSSet<UniversityEmployee *> *)employees{
    return _employees;
}

- (NSSet<Teacher *> *)teachers{
    return _teachers;
}

- (void)setChief:(DepartmentChief *)chief{
    _chief = chief;
    [self addEmployee:chief];
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rName: %@\rChief: %@", self.name, self.chief]];
}

- (void)addEmployee:(UniversityEmployee *)employee{
    [_employees addObject:employee];
    employee.department = self;
    
    if ([employee isKindOfClass:[Teacher class]]) {
        [_teachers addObject:(Teacher *)employee];
        
        [(Teacher *)employee addObserver:self forKeyPath:@"meanGrade" options:NSKeyValueObservingOptionNew context:TeachersKVOContext];
        [self recalculateMeanGrade];
    }
}

- (void)addEmployees:(NSArray<UniversityEmployee *> *)employees{
    for (UniversityEmployee *employee in employees) {
        [self addEmployee:employee];
    }
}


#pragma mark - Private
- (void)recalculateMeanGrade{
    float meanGrade;
    NSSet *teachers = self.teachers;
    for (Teacher * teacher in teachers) {
        meanGrade += teacher.meanGrade;
    }
    
    self.meanGrade = meanGrade/teachers.count;
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (context == TeachersKVOContext) {
        if ([object isKindOfClass:[Teacher class]]) {
            if ([keyPath isEqualToString:@"meanGrade"]) {
                [self recalculateMeanGrade];
            }
        }
    }
}

@end

//
//  University.m
//  Lab1-2
//
//  Created by Александр on 17.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "University.h"
#import "Department.h"
#import "Group.h"

@interface University ()

@property (nonatomic, strong) NSMutableArray *uDepartments;
@property (nonatomic, strong) NSMutableArray *uStudents;
@property (nonatomic, strong) NSMutableArray *uTeachers;
@property (nonatomic, strong) NSMutableArray *uHeadsOfDepartments;

@end

@implementation University

- (void)addDepartment:(Department *)department
{
    if (self.uDepartments == nil)
    {
        _uDepartments = [[NSMutableArray alloc] init];
    }
    
    if (self.uHeadsOfDepartments == nil)
    {
        _uHeadsOfDepartments = [[NSMutableArray alloc] init];
    }
    
    if (self.uStudents == nil)
    {
        _uStudents = [[NSMutableArray alloc] init];
    }
    
    if (self.uTeachers == nil)
    {
        _uTeachers = [[NSMutableArray alloc] init];
    }
    
    [self.uDepartments addObject:department];
    [_uHeadsOfDepartments addObject:department.headOfDepartment];
    [_uTeachers addObjectsFromArray:department.teachers];
    
    for (Group *group in department.groups)
    {
        [_uStudents addObjectsFromArray:group.students];
    }

}


- (NSArray *)departments
{
    return _uDepartments;
}

- (NSArray *)students
{
    return _uStudents;
}

- (NSArray *)teachers
{
    return _uTeachers;
}

- (NSArray *)headsOfDepartments
{
    return _uHeadsOfDepartments;
}

+ (instancetype)sharedInstance
{
    static University *_sharedInstance = nil;
    @synchronized(self)
    {
        if (_sharedInstance == nil)
        {
            _sharedInstance = [[University alloc] init];
        }
    }
    return _sharedInstance;
}

@end

//
//  Specialist.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Specialist.h"

@implementation Specialist

@synthesize salary = _salary, degree = _degree, universityName = _universityName, departmentName = _departmentName, subordinatesList = _subordinatesList;

// NSString *const kStringStudentDegree = @"Student";
NSString *const kStringPostgraduateDegree = @"Postgraduate Student";
NSString *const kStringLecturerDegree = @"Lecturer";
NSString *const kStringSeniorLecturerDegree = @"Senior Lecturer";
NSString *const kStringHeadOfDepartmentDegree = @"Head Of Department";
NSString *const kStringRectorDegree = @"Rector";

#pragma mark -
#pragma mark Initializers

- (id) initSpicialistWith:(NSString *) firstName
                         :(NSString *) lastName
                         :(NSString *) nickName
                         :(NSNumber *) age
                         :(NSNumber *) gender
                         :(NSString *) university
                         :(NSString *) department
                         :(NSNumber *) salary
                         :(NSNumber *) degree {
    if (self = [super initWith:firstName :lastName :nickName :age :gender]) {
        _universityName = university;
        _departmentName = department;
        _salary = [NSNumber numberWithInt:[salary intValue]];
        _degree = [NSNumber numberWithInt:[degree intValue]];
        _subordinatesList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

- (id) init {
    if (self = [super init]) {
        _universityName = @"Unknown University";
        _departmentName = @"Unknown Department";
        _salary = [NSNumber numberWithInt:0];
        _degree = [NSNumber numberWithInt:kPostgraduateDegree]; // Least degree for unknown specialist
        _subordinatesList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

#pragma mark -
#pragma mark Protocol EducationMember Implementation

- (void) setChief:(id)chief {
    if (_chief) {
        [_chief removeFromSubordunateList:self];
    }
    _chief = chief;
    [chief addSubordinate:self];
    [chief addSubordinateList:_subordinatesList];
}

- (id) getChief {
    return _chief;
}

- (void) setSubordinatesList:(NSArray *)subordinateList{
    [_subordinatesList removeAllObjects];
    [_subordinatesList addObjectsFromArray:subordinateList];
}

- (NSArray *) getSubordinatesList{
    return [NSArray arrayWithArray:_subordinatesList];
    
}

- (void) addSubordinate:(id)subordinate{
    [_subordinatesList addObject:subordinate];
}

- (void) addSubordinateList:(NSArray *)subordinateList {
    [_subordinatesList addObjectsFromArray:subordinateList];
}

- (void) removeFromSubordunateList:(id)member {
    if (_chief) {
        [_chief removeFromSubordunateList:member];
    }
    if ([member getSubordinatesList]) {
            [_subordinatesList removeObjectsInArray:[NSArray arrayWithArray:[member getSubordinatesList]]];
    }
    [_subordinatesList removeObject:member];
}

- (void) removeChief {
    [self setChief:nil];
}


@end

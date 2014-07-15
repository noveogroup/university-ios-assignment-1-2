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

// Decignated initializer
- (id) initSpicialistWith:(NSString *) firstName
                         :(NSString *) lastName
                         :(NSString *) nickName
                         :(NSNumber *) age
                         :(HumanGender) gender
                         :(NSString *) university
                         :(NSString *) department
                         :(NSNumber *) salary
                         :(MemberDegree) degree {
    if (self = [super initWith:firstName :lastName :nickName :age :gender]) {
        _universityName = university;
        _departmentName = department;
        _salary = [NSNumber numberWithInt:[salary intValue]];
        _degree = degree;
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
        _degree = memberDegreePostgraduateDegree; // Least degree for unknown specialist
        _subordinatesList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

#pragma mark -
#pragma mark Protocol EducationMember Implementation

- (void) setChief:(id<EducationMember>)chief {
    if (_chief) {
        [_chief removeFromSubordunateList:self];
    }
    if (chief) {
        if (![[chief getSubordinatesList]containsObject:self]) { // Protect from duplicate addition to list
            [chief addSubordinate:self];
        }
    }
    _chief = chief;
}

// Use Default getter
/*
- (id) getChief {
    return _chief;
}
*/

- (void) setSubordinatesList:(NSArray *)subordinateList{
    [_subordinatesList removeAllObjects];
    [_subordinatesList addObjectsFromArray:subordinateList];
}

- (NSArray *) getSubordinatesList{
    return [NSArray arrayWithArray:_subordinatesList];
    
}

- (void) addSubordinate:(id<EducationMember>)subordinate{
    if (![_subordinatesList containsObject:subordinate]) { // Protect from duplicate addition to list
        [_subordinatesList addObject:subordinate];
    }
}

- (void) addSubordinateList:(NSArray *)subordinateList {
    [_subordinatesList addObjectsFromArray:subordinateList];
}

- (void) removeFromSubordunateList:(id<EducationMember>)member {
    // Chef must knew only nearest subordinates
/*
    if (_chief) {
        [_chief removeFromSubordunateList:member];
    }
    
    NSArray *currentSubordinatesList = [NSArray arrayWithArray:[member getSubordinatesList]];
    if (currentSubordinatesList) {
            [_subordinatesList removeObjectsInArray:currentSubordinatesList];
    }
 */
    [_subordinatesList removeObject:member];
}

- (void) removeChief {
    [self setChief:nil];
}

- (NSString *) universityName {
    if (_universityName) {
        return _universityName;
    }
    return [_chief universityName];
}

- (NSString *) departmentName {
    if (_departmentName) {
        return _departmentName;
    }
    return [_chief departmentName];
}

@end

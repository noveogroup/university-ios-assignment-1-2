//
//  Specialist.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Specialist.h"

@implementation Specialist

@synthesize salary = _salary, degree = _degree, universityName = _universityName, departmentName = _departmentName;
@synthesize subordinatesList = _subordinatesList;

static NSString *const defaultSpecialistFirstName = @"Unknown Specialist Firstname";
static NSString *const defaultSpecialistLastName = @"Unknown Specialist Lastname";
static NSString *const defaultSpecialistNickName = @"Unknown Specialist Nickname";

static const int defaultSpecialistAge = 35;
static const int defaultSpecialistSalary = 50000;
static const MemberDegree defaultSpecialistDegree = memberDegreePostgraduateDegree;

#pragma mark -
#pragma mark Initializers

// Decignated initializer
- (id<EducationMember>) initSpecialistWithFirstName:(NSString *) newFirstName
                          lastName:(NSString *) newLastName
                          nickName:(NSString *) newNickName
                               age:(NSNumber *) newAge
                            gender:(HumanGender) newGender
                        university:(NSString *) newUniversity
                        department:(NSString *) newDepartment
                            salary:(NSNumber *) newSalary
                            degree:(MemberDegree) newDegree {
    if (self = [super initWithFirstName:newFirstName
                               lastName:newLastName
                               nickName:newNickName
                                    age:newAge
                                 gender:newGender]) {
        _universityName = newUniversity;
        _departmentName = newDepartment;
        _salary = newSalary;
        _degree = newDegree;
        _subordinatesList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

- (id<EducationMember>) initSpecialistWithFirstName:(NSString *) newFirstName
                                           lastName:(NSString *) newLastName
                                             degree:(MemberDegree) newDegree
                                         department:(NSString *)newDepartment{
    return [self initSpecialistWithFirstName:newFirstName
                                    lastName:newLastName
                                    nickName:defaultSpecialistNickName
                                         age:[NSNumber numberWithInt:defaultSpecialistAge]
                                      gender:humanGenderIsNotDefined
                                  university:nil
                                  department:newDepartment
                                      salary:[NSNumber numberWithInt:defaultSpecialistSalary]
                                      degree:defaultSpecialistDegree];
}

- (id<EducationMember>) init {
    return [self initSpecialistWithFirstName:defaultSpecialistFirstName
                                    lastName:defaultSpecialistLastName
                                    nickName:defaultSpecialistNickName
                                         age:[NSNumber numberWithInt:defaultSpecialistAge]
                                      gender:humanGenderIsNotDefined
                                  university:nil
                                  department:nil
                                      salary:[NSNumber numberWithInt:defaultSpecialistSalary]
                                      degree:defaultSpecialistDegree];
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

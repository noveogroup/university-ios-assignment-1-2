//
//  Student.m
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize degree = _degree, universityName = _universityName, departmentName = _departmentName, averagePoints = _averagePoints, lecturerList = _lecturerList, chief = _chief;
@synthesize delegate = _delegate;

static NSString *const defaultStudentFirstName = @"Unknown Student Firstname";
static NSString *const defaultStudentLastName = @"Unknown Student Lastname";
static NSString *const defaultStudentNickName = @"Unknown Student Nickname";

static const int defaultStudentAge = 17;
static const float defaultStudentAveragePoints = 4.1;
static const MemberDegree defaultStudentDegree = memberDegreeStudentDegree;


- (void) setDelegate:(id<RecalculatePointsDelegate>)aDelegate {
    _delegate = aDelegate;
}

#pragma mark -
#pragma mark Initializers

// Decignated initializer
- (id<EducationMember>) initSudentWithFirstName:(NSString *) newFirstName
                                       lastName:(NSString *) newLastName
                                       nickName:(NSString *) newNickName
                                            age:(NSNumber *) newAge
                                         gender:(HumanGender) newGender
                                     university:(NSString *) newUniversity
                                     department:(NSString *) newDepartment
                                  averagePoints:(NSNumber *) newAveragePoints {
    if (self = [super initWithFirstName:newFirstName
                               lastName:newLastName
                               nickName:newNickName
                                    age:newAge
                                 gender:newGender]) {
        _universityName = newUniversity;//university;
        _departmentName = newDepartment;
        _averagePoints = newAveragePoints;
        _degree = defaultStudentDegree;
        _lecturerList = [[NSMutableArray alloc]init];
        _chief = nil;
    }
    return self;
}

- (id<EducationMember>) initStudenttWithFirstName:(NSString *) newFirstName
                                         lastName:(NSString *) newLastName
                                              age:(NSNumber *) newAge {
    return [self initSudentWithFirstName:newFirstName
                                lastName:newLastName
                                nickName:defaultStudentNickName
                                     age:newAge
                                  gender:humanGenderIsNotDefined
                              university:nil
                              department:nil
                           averagePoints:[NSNumber numberWithFloat:defaultStudentAveragePoints]];
}
    
- (id<EducationMember>) init {
    return [self initSudentWithFirstName:defaultStudentFirstName
                                lastName:defaultStudentLastName
                                nickName:defaultStudentNickName
                                     age:[NSNumber numberWithInt:defaultStudentAge]
                                  gender:humanGenderIsNotDefined
                              university:nil
                              department:nil
                           averagePoints:[NSNumber numberWithFloat:defaultStudentAveragePoints]];
}

#pragma mark -
#pragma mark Protocol EducationMember Implementation
    
- (void) setChief:(id<EducationMember>)chief {
    if (_chief) {
        [_chief removeFromSubordunateList:self];
    }
    if (chief) {
        [chief addSubordinate:self];
    }
    _chief = chief;
}


- (void) setSubordinatesList:(NSArray *)subordinateList{
    NSLog(@"Adding subordinate list error: Student can't have a subordinates");
}

- (NSArray *) getSubordinatesList{
    // NSLog(@"Getting subordinate list error: Student can't have a subordinates");
    return nil;
    
}

- (void) addSubordinate:(id)subordinate{
    NSLog(@"Adding subordinate error: Student can't have a subordinates");
}

- (void) removeFromSubordunateList:(id)member {
    NSLog(@"Removing subordinate list error: Student can't have a subordinates");
}

- (void) removeChief {
    [self setChief:nil];
}

- (NSString *) universityName {
    return [_chief universityName];
}

- (NSString *) departmentName {
    return [_chief departmentName];
}

- (void) setAveragePoints:(NSNumber *)averagePoints {
    _averagePoints = averagePoints;
        if ([_delegate respondsToSelector:@selector(recalculatePoints)]) {
            [_delegate recalculatePoints];
        }
}

- (NSNumber *) averagePoints {
    return _averagePoints;
}
    

@end

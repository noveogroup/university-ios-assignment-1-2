//
//  EducationMember.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EducationMember <NSObject>

enum {
    kStudentDegree = 0,
    kPostgraduateDegree = 1,
    kLecturerDegree = 2,
    kSeniorLecturerDegree = 3,
    kHeadOfDepartmentDegree = 4,
    kRectorDegree = 5
};

@optional
- (void) setChief:(id)chief;
- (id) getChief;
- (void) setSubordinatesList:(NSArray *)subordinateList;
- (NSArray *) getSubordinatesList;
- (void) addSubordinate:(id)subordinate;
- (void) addSubordinateList:(NSArray *)subordinateList;
- (void) removeFromSubordunateList:(id)member;
- (void) removeChief;

@end

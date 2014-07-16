//
//  EducationMember.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EducationMember <NSObject>

@property (nonatomic, readonly, copy) NSString *universityName;
@property (nonatomic, readonly, copy) NSString *departmentName;

typedef enum {
    // CR: rename all values using this style: RENAMED
    memberDegreeStudentDegree = 0,
    memberDegreePostgraduateDegree = 1,
    memberDegreeLecturerDegree = 2,
    memberDegreeSeniorLecturerDegree = 3,
    memberDegreeHeadOfDepartmentDegree = 4,
    memberDegreeRectorDegree = 5
} MemberDegree;

@optional
// DEBUG setChief -> chief
- (void) setChief:(id<EducationMember>)chief; // Debuged
- (id<EducationMember>) getChief;
- (void) setSubordinatesList:(NSArray *)subordinateList;
- (NSArray *) getSubordinatesList;
- (void) addSubordinate:(id<EducationMember>)subordinate;
- (void) addSubordinateList:(NSArray *)subordinateList;
- (void) removeFromSubordunateList:(id<EducationMember>)member;
- (void) removeChief;

@end

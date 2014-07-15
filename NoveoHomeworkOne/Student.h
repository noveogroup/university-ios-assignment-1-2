//
//  Student.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Human.h"
#import "EducationMember.h"

@interface Student : Human <EducationMember>

@property (nonatomic, retain, readonly) NSNumber *degree; // Degree for Student is constantly init by 0
@property (nonatomic, copy) NSString *universityName; // CR: Can be read from chief.
@property (nonatomic, copy) NSString *departmentName;
@property (nonatomic, retain) NSNumber *averagePoints;
@property (nonatomic, retain) NSMutableArray *lecturerList;
@property (nonatomic, weak) id<EducationMember> chief;

// Decignated initializer
- (id) initStudentWith:(NSString *) firstName
                      :(NSString *) lastName
                      :(NSString *) nickName
                      :(NSNumber *) age
                      :(HumanGender) gender
                      :(NSString *) university
                      :(NSString *) department
                      :(NSNumber *) averagePoints;


@end

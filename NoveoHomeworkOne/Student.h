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

@property (nonatomic, assign, readonly) MemberDegree degree; // Degree for Student is constantly init by memberDegreeStudentDegree;
@property (nonatomic, copy) NSString *universityName; // CR: Can be read from chief.
@property (nonatomic, copy) NSString *departmentName;
@property (nonatomic, strong) NSNumber *averagePoints;
@property (nonatomic, weak) id<EducationMember> chief;

// Decignated initializer
- (id<EducationMember>) initSudentWithFirstName:(NSString *) newFirstName
                                       lastName:(NSString *) newLastName
                                       nickName:(NSString *) newNickName
                                            age:(NSNumber *) newAge
                                         gender:(HumanGender) newGender
                                     university:(NSString *) newUniversity
                                     department:(NSString *) newDepartment
                                  averagePoints:(NSNumber *) newAveragePoints;

- (id<EducationMember>) initStudenttWithFirstName:(NSString *) newFirstName
                                         lastName:(NSString *) newLastName
                                              age:(NSNumber *) newAge;


@end

@interface Student ()
    @property (nonatomic, strong) NSMutableArray *lecturerList;
@end

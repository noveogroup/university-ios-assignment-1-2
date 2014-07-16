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

@property (nonatomic, strong, readonly) NSNumber *degree; // Degree for Student is constantly init by 0
@property (nonatomic, copy) NSString *universityName; // CR: Can be read from chief.
@property (nonatomic, copy) NSString *departmentName;
@property (nonatomic, strong) NSNumber *averagePoints;
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

@interface Student ()
    @property (nonatomic, strong) NSMutableArray *lecturerList;
@end

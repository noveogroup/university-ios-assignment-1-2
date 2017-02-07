//
//  Specialist.h
//  NoveoHomeworkOne
//
//  Created by Wadim on 7/14/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "Human.h"
#import "EducationMember.h"

@interface Specialist : Human <EducationMember>

@property (nonatomic, strong) NSNumber *salary;
@property (nonatomic, assign) MemberDegree degree;
@property (nonatomic, weak) id<EducationMember> chief;

// Decignated initializer
- (instancetype) initSpecialistWithFirstName:(NSString *) newFirstName
                                    lastName:(NSString *) newLastName
                                    nickName:(NSString *) newNickName
                                         age:(NSNumber *) newAge
                                      gender:(HumanGenderId) newGenderId
                                  university:(NSString *) newUniversity
                                  department:(NSString *) newDepartment
                                      salary:(NSNumber *) newSalary
                                      degree:(MemberDegree) newDegree;

- (instancetype) initSpecialistWithFirstName:(NSString *) newFirstName
                                    lastName:(NSString *) newLastName
                                      degree:(MemberDegree) newDegree
                                  department:(NSString*)newDepartment;


@end

@interface Specialist ()
    @property (nonatomic, strong) NSMutableArray *subordinatesList;
@end

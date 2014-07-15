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

@property (nonatomic, retain) NSNumber *salary;
@property (nonatomic, retain) NSNumber *degree;
@property (nonatomic, copy) NSString *universityName;
@property (nonatomic, copy) NSString *departmentName;
@property (nonatomic, retain) NSMutableArray *subordinatesList;
@property (nonatomic, weak) id chief;

- (id) initSpicialistWith:(NSString *) firstName
                         :(NSString *) lastName
                         :(NSString *) nickName
                         :(NSNumber *) age
                         :(NSNumber *) gender
                         :(NSString *) university
                         :(NSString *) department
                         :(NSNumber *) salary
                         :(NSNumber *) degree;


@end

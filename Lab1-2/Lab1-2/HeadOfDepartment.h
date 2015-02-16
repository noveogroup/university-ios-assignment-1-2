//
//  HeadOfDepartment.h
//  LabWork1-2
//
//  Created by Александр on 15.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Teacher.h"
#import "MemberOfEducationProcess.h"

@interface HeadOfDepartment : Teacher <MemberOfEducationProcess>

@property (nonatomic, readonly) NSArray * superiors;
@property (nonatomic, readonly) NSArray * inferiors;

@end

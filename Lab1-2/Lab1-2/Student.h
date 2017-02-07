//
//  Student.h
//  LabWork1-2
//
//  Created by Александр on 14.02.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "Person.h"
#import "MemberOfEducationProcess.h"
#import "AveragePointObserver.h"
#import "Observable.h"
@class Group;

@interface Student : Person <MemberOfEducationProcess, Observable>

@property (nonatomic) NSNumber *averagePoint;
@property (weak) Group *group;


- (instancetype)initStudentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andAveragePoint:(NSNumber *) aPoint;


@end

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
@class Group;

@interface Student : Person <MemberOfEducationProcess>

@property (nonatomic) NSNumber *averagePoint;
@property (weak) Group *group;

- (void)changeAveragePoint:(NSNumber *) newPoint;
- (Student *)initStudentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSNumber *)age andAveragePoint:(NSNumber *) aPoint;

- (void)addObserverForStudent:(id<AveragePointObserver>) observer;
- (void)removeObserverForStudent:(id<AveragePointObserver>) observer;

@end

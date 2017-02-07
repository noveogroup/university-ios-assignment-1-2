//
//  University.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniversityEmployee.h"
@class Student;



@interface University : NSObject <UniversityEmployee>
@property (copy, nonatomic) NSArray *subordinates;
@property (strong, nonatomic) id<UniversityEmployee> boss;


- (void)addSubordinate:(id<UniversityEmployee>)aSub;
- (void)generateUniversityEmployees;
- (void)getSubordinatesList;

- (NSArray *)getStudentsOfDepartmentFromStudent:(Student *)student;
- (float)getOverallGPAOfDepartmentWithBoss:(id<UniversityEmployee>)dHead;

@end

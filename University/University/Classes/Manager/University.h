//
//  University.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniversityEmployee.h"
@class EmployeeData;



@interface University : NSObject <UniversityEmployee, EmployeeDataDelegate>
@property (copy, nonatomic) NSArray *subordinates;
@property (strong, nonatomic) EmployeeData *eData;

- (void)addSubordinate:(id<UniversityEmployee>)aSub;
- (void)generateUniversityEmployees;
- (void)getSubordinatesList;



@end

//
//  University.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniversityEmployee.h"




@interface University : NSObject <UniversityEmployee, EmployeeDataDelegate>
@property (strong, nonatomic) NSMutableArray *subordinates;
@property (strong, nonatomic) EmployeeData *eData;
@property (assign, nonatomic) NSInteger count;

- (void)addSubordinate:(id<UniversityEmployee>)aSub;
- (void)generateUniversityEmployees;
- (void)getSubordinatesList;



@end

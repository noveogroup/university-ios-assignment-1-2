//
//  UniversityEmployee.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeData.h"


@protocol UniversityEmployee <NSObject>
@property (strong, nonatomic) NSMutableArray *subordinates;

- (void)addSubordinate:(id<UniversityEmployee>)aSub;

@optional
- (void)getSubordinatesList;
- (NSString *)detailedDescription;

@end



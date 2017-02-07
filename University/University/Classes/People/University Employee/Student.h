//
//  Student.h
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Human.h"
#import "UniversityEmployee.h"

@interface Student : Human <UniversityEmployee>

@property (assign, nonatomic) float GPA;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSArray *subordinates;
@property (strong, nonatomic) id<UniversityEmployee> boss;


float randomGPA (void);


@end

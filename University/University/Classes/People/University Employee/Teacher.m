//
//  Teacher.m
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Teacher.h"



@implementation Teacher

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gender = arc4random() % 2;
        self.firstName = [self randomFirstNameForGender:self.gender];
        self.lastName = [self randomLastName];
        int minAge = 25;
        int maxAge = 75;
        self.age = randomAge(minAge, maxAge);
        self.type = @"Teacher";
        self.salary = 40000;
        self.subordinates = [NSArray array];
        
    }
    return self;
}

- (NSString *)detailedDescription {
    NSString *gender = self.gender == Male ? @"Male" : @"Female";
    NSString *string = [NSString stringWithFormat: @""
                        "Teacher: fullname - %@ %@, \n"
                        "gender - %@, \n"
                        "age - %ld years, \n"
                        "salary - $%ld, \n"
                        "students - %ld",
                        self.firstName, self.lastName, gender, self.age, self.salary, [self.subordinates count]];
    
    return string;
}

- (void)addSubordinate:(id<UniversityEmployee>)aSub {
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:aSub];
    self.subordinates = [self.subordinates arrayByAddingObjectsFromArray:[tempArray copy]];
    
}


- (void)getSubordinatesList {
    NSLog(@"%@", self);
    if ([self.subordinates count] != 0) {
        for (id <UniversityEmployee> object in self.subordinates) {
            [object getSubordinatesList];
        }
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"|--- %@, %@ %@", self.type, self.firstName, self.lastName];
}

@end

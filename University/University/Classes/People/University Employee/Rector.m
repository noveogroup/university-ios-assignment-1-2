//
//  Rector.m
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Rector.h"




@implementation Rector

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gender = arc4random() % 2;
        self.firstName = [self randomFirstNameForGender:self.gender];
        self.lastName = [self randomLastName];
        int minAge = 40;
        int maxAge = 75;
        self.age = randomAge(minAge, maxAge);
        self.salary = 100000;
        self.type = @"Rector";
        
        self.subordinates = [NSArray array];

    }
    return self;
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
    return [NSString stringWithFormat:@"%@, %@ %@", self.type, self.firstName, self.lastName];
}

- (NSString *)detailedDescription {
    return [NSString stringWithFormat:@"%@, %@ %@, salary - $%ld", self.type, self.firstName, self.lastName, self.salary];
}


@end

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
        self.gender = [self randomGender];
        if (self.gender == Male) {
            self.firstName = [self randomMaleFirstName];
        } else {
            self.firstName = [self randomFemaleFirstName];
        }
        self.lastName = [self randomLastName];
        NSInteger minAge = 40;
        NSInteger maxAge = 75;
        NSRange range = NSMakeRange(minAge, maxAge - minAge);
        self.age = [self randomAgeFromRange:range];
        self.salary = 100000;
        self.type = @"Rector";
        
        self.eData = [EmployeeData sharedInstance];
        self.eData.delegate = self;
        [self.eData addObj:self];

    }
    return self;
}

- (void)endOfSomething {
    NSLog(@"Something happened");
}





- (NSMutableArray *)subordinates {
    if (_subordinates == nil) {
        _subordinates = [[NSMutableArray alloc] init];
    }
    return _subordinates;
}

- (void)addSubordinate:(id<UniversityEmployee>)aSub {
    [self.subordinates addObject:aSub];
}

- (void)getSubordinatesList {
    NSLog(@"%@", [self description]);
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

//
//  PersonGenerator.m
//  University
//
//  Created by Oleg Sannikov on 2/22/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "NSArray+Random.h"
#import "NSDate+Utilities.h"
#import "PersonGenerator.h"
#import "Person.h"

@interface PersonGenerator ()
@property (nonatomic) NSArray<NSString *> *maleFirstNames;
@property (nonatomic) NSArray<NSString *> *femaleFirstNames;
@property (nonatomic) NSArray<NSString *> *lastNames;

@end

@implementation PersonGenerator
- (instancetype)init{
    self = [super init];
    if (self) {
        _maleFirstNames = @[@"John", @"James", @"Kurt", @"Robert", @"Alexander"];
        _femaleFirstNames = @[@"Claire", @"Heather", @"Mary", @"Kate", @"Megan"];
        _lastNames = @[@"Smith", @"Feynman", @"White", @"Satriani", @"Bush", @"Johnson", @"Simpson", @"Gray", @"Carrick", @"Hamilton"];
    }
    return self;
}

- (Person *)randomPerson{
    Gender gender = arc4random_uniform(2);
    
    NSString *firstName = (gender == GenderMale) ? self.maleFirstNames.randomObject : self.femaleFirstNames.randomObject;
    NSString *lastName = self.lastNames.randomObject;
    
    NSUInteger minAge = 18;
    NSUInteger maxAge = 70;
    NSDate *birthdate = [NSDate dateWithDaysFromNow: -(365*minAge + arc4random_uniform((unsigned int)(365*(maxAge - minAge))))];
    
    Person *person = [[Person alloc] initWithFirstName:firstName lastName:lastName gender:gender andBirthdate:birthdate];
    
    return person;
}

@end

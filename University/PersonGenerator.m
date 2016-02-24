//
//  PersonGenerator.m
//  University
//
//  Created by Oleg Sannikov on 2/22/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "PersonGenerator.h"
#import "Person.h"

@interface PersonGenerator (){
    NSArray *_maleFirstNames;
    NSArray *_femaleFirstNames;
    NSArray *_lastNames;
}

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
    NSString *firstName = (gender == GenderMale) ? _maleFirstNames[arc4random_uniform(_maleFirstNames.count)] : _femaleFirstNames[arc4random_uniform(_maleFirstNames.count)];
    NSString *lastName = _lastNames[arc4random_uniform(_lastNames.count)];
    NSTimeInterval dayInterval = 60*60*24;
    NSDate *birthdate = [NSDate dateWithTimeIntervalSince1970:dayInterval*arc4random_uniform(365*25)];
    
    Person *person = [[Person alloc] initWithFirstName:firstName lastName:lastName gender:gender andBirthdate:birthdate];
    
    return person;
}

@end

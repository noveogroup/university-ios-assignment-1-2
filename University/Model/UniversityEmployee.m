//
//  UniversityEmployee.m
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import "UniversityEmployee.h"
#import "Department.h"

@interface UniversityEmployee (){
    NSMutableSet <id<EducationalProcessParticipant>> *_supers;
    NSMutableSet <id<EducationalProcessParticipant>> *_subs;
}

@end

@implementation UniversityEmployee
#pragma mark - Lifecycle
- (void)commonInit{
    _supers = [NSMutableSet new];
    _subs = [NSMutableSet new];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
                           gender:(Gender)gender andBirthdate:(NSDate *)birthdate{
    self = [super initWithFirstName:firstName lastName:lastName gender:gender andBirthdate:birthdate];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithPerson:(Person *)person{
    self = [super initWithPerson:person];
    if (self) {
        [self commonInit];
    }
    
    return self;
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rDepartment: %@", self.department.name]];
}


#pragma mark - EducationalProcessParticipant
- (NSSet<id<EducationalProcessParticipant>> *)supers{
    return _supers;
}

- (NSSet<id<EducationalProcessParticipant>> *)subs{
    return _subs;
}

- (void)addSuper:(id<EducationalProcessParticipant>)sup{
    [_supers addObject:sup];
}

-(void)addSub:(id<EducationalProcessParticipant>)sub{
    [_subs addObject:sub];
    [sub addSuper:self];
}

- (void)addSupers:(NSArray<id<EducationalProcessParticipant>> *)supers{
    for (id<EducationalProcessParticipant> sup in supers) {
        [self addSuper:sup];
    }
}

- (void)addSubs:(NSArray<id<EducationalProcessParticipant>> *)subs{
    for (id<EducationalProcessParticipant> sub in subs) {
        [self addSub:sub];
    }
}

@end

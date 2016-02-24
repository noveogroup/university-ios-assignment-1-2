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
- (instancetype)init{
    self = [super init];
    if (self) {
        _supers = [NSMutableSet new];
        _subs = [NSMutableSet new];
    }
    
    return self;
}


#pragma mark - Public
- (NSString *)description{
    return [[super description] stringByAppendingString:[NSString stringWithFormat:@"\rDepartment: %@", self.department.name]];
}


#pragma mark - EducationalProcessParticipant
- (NSSet<id<EducationalProcessParticipant>> *)supers{
    return [_supers copy];
}

- (NSSet<id<EducationalProcessParticipant>> *)subs{
    return [_subs copy];
}

- (void)addSuper:(id<EducationalProcessParticipant>)sup{
    [_supers addObject:sup];
}

-(void)addSub:(id<EducationalProcessParticipant>)sub{
    [_subs addObject:sub];
    [sub addSuper:self];
}

- (void)addSupers:(NSArray<id<EducationalProcessParticipant>> *)supers{
    [_supers  addObjectsFromArray:supers];
}

- (void)addSubs:(NSArray<id<EducationalProcessParticipant>> *)subs{
    [_subs addObjectsFromArray:subs];
    for (id<EducationalProcessParticipant> sub in subs) {
        [sub addSuper:self];
    }
}

@end

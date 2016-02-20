//
//  GSHuman.m
//  Lab1
//
//  Created by Sukhorukov Grigory on 20.02.16.
//  Copyright © 2016 Sukhorukov Grigory. All rights reserved.
//

#import "GSHuman.h"

@implementation GSHuman

static NSString* names[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static int namesCount = 50;

@synthesize masters, dependents;

- (instancetype)initRand
{
    self = [super init];
    if (self) {
        self.name = names[arc4random()%namesCount];
        self.age = arc4random()%4+17;
        
        self.dependents = [NSMutableArray array];
        self.masters = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithName:(NSString*) name age:(NSInteger) age
{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        
        self.dependents = [NSMutableArray array];
        self.masters = [NSMutableArray array];
    }
    return self;
}


#pragma mark - participantInTheLearningProcess

- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
    if (self.dependents && ![self.dependents containsObject:dependent]) {
        [self.dependents addObject:dependent];
        [dependent addMaster:self];
    }
}

- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
    if (self.dependents && [self.dependents containsObject:dependent]) {
        [self.dependents removeObject:dependent];
        [dependent removeMaster:self];
    }
}

- (void) addMaster:(id<participantInTheLearningProcess>) master{
    if (self.masters && ![self.masters containsObject:master]) {
        [self.masters addObject:master];
        [master addDependent:self];
    }
}

- (void) removeMaster:(id<participantInTheLearningProcess>) master{
    if (self.masters && [self.masters containsObject:master]) {
        [self.masters removeObject:master];
        [master removeDependent:self];
    }
}


#pragma mark - description

- (NSString *)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"name %@", self.name];
    
    [description appendString:@"\nDependents:"];
    for (GSHuman<participantInTheLearningProcess>* dependent in self.dependents) {
        [description appendFormat:@"\n   %@", dependent.name];
    }
    
    [description appendString:@"\nMasters:"];
    for (GSHuman<participantInTheLearningProcess>* master in self.masters) {
        [description appendFormat:@"\n   %@", master.name];
    }
    
    return [NSString stringWithString:description];
}


@end

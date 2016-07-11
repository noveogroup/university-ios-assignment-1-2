//
//  Forest.m
//  LifeOfForest
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Forest.h"
#import "Grass.h"
#import "Herbivore.h"
#import "Predator.h"
#import "Rubbish.h"

@interface Forest ()

@property (nonatomic) NSMutableArray *forestBeings;

@end

@implementation Forest

- (instancetype)init
{
    self = [super init];
    if (self){
        _forestBeings = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            [self.forestBeings addObject:[[Grass alloc] init]];
        }
        for (int i=0; i<3; i++)
            [self.forestBeings addObject:[[Rubbish alloc] init]];
        for (int i=0; i<3; i++)
            [self.forestBeings addObject:[[Herbivore alloc] init]];
        for (int i=0; i<3; i++)
            [self.forestBeings addObject:[[Predator alloc] init]];
    }
    return self;
}


+ (Forest *)sharedInstance
{
    static Forest *_sharedInstance = nil;
    @synchronized(self) {
        if (!_sharedInstance) {
            _sharedInstance = [[Forest alloc] init];
        }
    }
    return _sharedInstance;
}

- (BOOL)canFirstCreature:(id<Eatable>)obj1 eatSecondCreature:(id<Eatable>)obj2 calories:(NSInteger *)calories
{
    //if ([obj1 isKindOfClass:[Herbivore class]] && ![obj2 respondsToSelector:@selector(eat:getCalories:)]) {
    if ([obj1 isKindOfClass:[Herbivore class]] && ![obj2 isKindOfClass:[Animal class]]) {
        *calories = [obj2 calories];
        return YES;
    }
    if ([obj1 isKindOfClass:[Predator class]] && ![obj2 isKindOfClass:[Grass class]]) {
        if ([obj2 isKindOfClass:[Rubbish class]]) {
            *calories = [obj2 calories];
            return YES;
        }
        if ([obj2 isKindOfClass:[Herbivore class]]) {
            Herbivore *herbivore = obj2;
            *calories = [herbivore calories] / 2;
            return ![herbivore isHide];
        }
        if ([obj2 isKindOfClass:[Predator class]]) {
            Predator *predator1 = obj1;
            Predator *predator2 = obj2;
            *calories = [predator2 calories] / 2;
            return (predator1.weight >= predator2.weight) && ![predator2 isProtected];
        }
    }
    *calories = 0;
    return NO;
}

- (NSInteger)numberOfHerbivore
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [Herbivore class]];
    NSArray *predicateResults = [self.forestBeings filteredArrayUsingPredicate:predicate];
    return predicateResults.count;
}


- (NSInteger)numberOfPredator
{
    NSInteger num = 0;
    for (id obj in self.forestBeings) {
        if ([obj isKindOfClass:[Predator class]]) num++;
    }
    return num;
}


- (void)daySimulation
{
    NSLog(@"Begin of day");
    while ([self numberOfHerbivore] > 0 || [self numberOfPredator] > 1) {
        int forestSize = (int)[self.forestBeings count];
        int index1 = arc4random_uniform(forestSize);
        int index2 = arc4random_uniform(forestSize);
        if (index1 != index2) {
            id<Eatable> obj1 = self.forestBeings[index1];
            id<Eatable> obj2 = self.forestBeings[index2];
            NSInteger numOfCalories = 0;
            if ([self canFirstCreature:obj1 eatSecondCreature:obj2 calories:&numOfCalories]) {
                Animal *animal = obj1;
                [animal eat:obj2 getCalories:numOfCalories];
                NSLog(@"%@ eat %@", [obj1 description], [obj2 description]);
                [self.forestBeings removeObject:obj2];
            }
        }
        
    }
    NSLog(@"End of day");
    
    for (id obj in self.forestBeings) {
        if ([obj isKindOfClass:[Predator class]]) {
            [obj showStomach];
            break;
        }
    }
}

@end

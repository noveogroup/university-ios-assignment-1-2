//
//  Forest.m
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forest.h"
#import "Creature.h"
#import "Predator.h"
#import "Plant.h"
#import "Herbivorous.h"
#import "Garbage.h"
#import "NSArray+Random.h"


@interface Forest ()

@property(nonatomic) NSMutableArray<Creature *> *creatures;
@property(nonatomic) NSMutableArray<Predator *> *predators;
@property(nonatomic) BOOL isLastPredator;

@end

@implementation Forest

@synthesize creatures = _creatures;
@synthesize predators = _predators;
@synthesize isLastPredator;

+ (instancetype)sharedInstance
{
    static Forest *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[Forest alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _creatures = [NSMutableArray array];
        _predators = [NSMutableArray array];
        [_creatures addObject:[[Plant alloc] initWithName:@"Цветок"]];
        [_creatures addObject:[[Plant alloc] initWithName:@"Листва"]];
        [_creatures addObject:[[Plant alloc] initWithName:@"Морковь"]];
        [_creatures addObject:[[Predator alloc] initWithName:@"Волк" weight:70]];
        [_creatures addObject:[[Predator alloc] initWithName:@"Лиса" weight:50]];
        [_creatures addObject:[[Predator alloc] initWithName:@"Медведь" weight:130]];
        [_creatures addObject:[[Herbivorous alloc] initWithName:@"Заяц"]];
        [_creatures addObject:[[Herbivorous alloc] initWithName:@"Ежик"]];
        [_creatures addObject:[[Herbivorous alloc] initWithName:@"Лось"]];
        [_creatures addObject:[[Garbage alloc] init]];
        [_creatures addObject:[[Garbage alloc] init]];
        [_creatures addObject:[[Garbage alloc] init]];
        
        for (Creature *creature in _creatures) {
            if ([creature isKindOfClass:[Predator class]]) {
                [_predators addObject:(Predator *)creature];
            }
        }
    }
    
    return self;
}

#pragma mark - MARK

- (void)simulate
{
    while (![self isLastPredator]) {
        Creature *creature1 = [_creatures randomObject];
        Creature *creature2 = [_creatures randomObject];
        
        NSInteger calories = 0;
        if ((![creature1 isEqual:creature2]) &&
            ([self canEatObj1:creature1 obj2:creature2 calories:&calories])) {
            [(Animal *)creature1 eat:creature2 withCalories:calories];
            [_creatures removeObject:creature2];
            
            if ([creature2 isKindOfClass:Predator.class]) {
                [_predators removeObject:(Predator *)creature2];
            }
            
            NSLog(@"%@ съел(а) %@", [creature1 description], [creature2 description]);
        }
    }
    NSLog(@"Остался последний хищник");
    [self inspectStomach:[_predators firstObject]];
}

- (void)inspectStomach:(Animal *)animal
{
    for (id creature in animal.stomach) {
        NSLog(@"%@ был(а) съеден(а) %@", [creature description], [animal description]);
        if ([creature isKindOfClass: Animal.class]) {
            [self inspectStomach:creature];
        }
    }
}

- (BOOL)canEatObj1:(Creature *)creature1 obj2:(Creature *)creature2 calories:(NSInteger *)calories
{
    if ([creature1 isKindOfClass:[Predator class]]) {
        if (([creature2 isKindOfClass:[Predator class]] && ([(Predator *)creature2 isProtected] == NO) &&
             (((Predator *)creature1).weight > ((Predator *)creature2).weight)) ||
            ([creature2 isKindOfClass:[Herbivorous class]] &&
             ([(Herbivorous *)creature2 isProtected] == NO)) || ([creature2 isKindOfClass:[Garbage class]])) {
            *calories = (creature2.calories > 0) ? (creature2.calories / 2) : creature2.calories;
            return YES;
        }
    }
    
    if ([creature1 isKindOfClass:[Herbivorous class]]) {
        if (([creature2 isKindOfClass:[Plant class]]) || ([creature2 isKindOfClass:[Garbage class]])) {
            *calories = creature2.calories;
            return YES;
        }
    }
                                                           
    return NO;
}

- (BOOL)isLastPredator
{
    return ([_predators count] == 1);
}



@end
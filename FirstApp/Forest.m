//
//  Forest.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Forest.h"
#import "Grass.h"
#import "Predator.h"
#import "Herbivorous.h"
#import "Life.h"

static const int nGrass = 4;
static const int nPredator = 2;
static const int nHerbivorous = 4;

@implementation Forest

static id _instance;

+ (Forest *) sharedInstance
{
    static dispatch_once_t once;
    static Forest *sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [self new];
                  });
    
    return sharedInstance;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.forestResidents = [[NSMutableArray alloc] init];
        
        for(int i=0;i<nGrass;i++){
            Grass *grass = [[Grass alloc]initWithName:[NSString stringWithFormat:@"Grass%d",i+1]];
            [self.forestResidents addObject:grass];
#ifdef DEBUG
            NSLog(@"%@",grass);
#endif
        }
        for(int i=0;i<nPredator;i++){
            Predator *predator = [[Predator alloc]initWithWeight:ABS((BOOL)arc4random()%100) + 50 andName:[NSString stringWithFormat:@"Predator%d",i+1]];
            [self.forestResidents addObject:predator];
#ifdef DEBUG
            NSLog(@"%@",predator);
#endif
        }
        for(int i=0;i<nHerbivorous;i++){
            Herbivorous *herbivorous = [[Herbivorous alloc]initWithName:[NSString stringWithFormat:@"Herbivorous%d",i+1]];
            [self.forestResidents addObject:herbivorous];
#ifdef DEBUG
            NSLog(@"%@",herbivorous);
#endif
        }
        
    }
    return self;
}

- (void)simulateDay{
    while ([self hasPredator] || [self hasHerbivorous]) {
        int ifirst = arc4random()%[self.forestResidents count];
        int iSecond = arc4random()%[self.forestResidents count];
        id firstResident = self.forestResidents[ifirst];
        id secondResident = self.forestResidents[iSecond];
        if(firstResident != secondResident){
            if ([self canEatFirst:firstResident andSecond:secondResident]) {
                if ([firstResident respondsToSelector:@selector(eat:)]) {
                    [firstResident performSelector:@selector(eat:) withObject:secondResident];
                }
            }
        }
    }
    
}


- (BOOL)hasPredator{
    int count = 0;
    for(Life *resident in self.forestResidents){
        if ([resident isKindOfClass:[Predator class]]) {
            count++;
            if(count>1){
                return YES;
            }
        }
    }
    return NO;
}

- (BOOL)hasHerbivorous{
    for(Life *resident in self.forestResidents){
        if ([resident isKindOfClass:[Herbivorous class]]) {
            return YES;
        }
    }
    return NO;
}


- (void)deleteResident:(id)resident{
    if([self.forestResidents containsObject:resident]){
        [self.forestResidents removeObject:resident];
    }
}

- (BOOL)canEatFirst:(Life *)first
          andSecond:(Life *)second{
    if ([first isKindOfClass:[Grass class]]) {
        return NO;
    } else if ([first isKindOfClass:[Herbivorous class]]){
        if ([second isKindOfClass:[Grass class]]) {
            return YES;
        }
    } else if ([first isKindOfClass:[Predator class]]){
        if ([second isKindOfClass:[Herbivorous class]]) {
            if ([second respondsToSelector:@selector(isHide)]) {
                if ([second performSelector:@selector(isHide)]) {
                    return YES;
                }
            }
        } else if ([second isKindOfClass:[Predator class]]){
            if(((Predator*)first).weight > ((Predator*)second).weight && !((Predator*)second).isProtect){
                return YES;
            }
        }
    }
    return NO;
}



@end

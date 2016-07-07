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
#import "RulesOfLife.h"
#import "Garbage.h"
#import "Animal.h"

static const int nGrass = 4;
static const int nPredator = 2;
static const int nHerbivorous = 4;
static const int nGarbage = 4;

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
//#ifdef DEBUG
//            NSLog(@"%@",grass);
//#endif
        }
        for(int i=0;i<nPredator;i++){
            Predator *predator = [[Predator alloc]initWithWeight:ABS((BOOL)arc4random()%100) + 50 andName:[NSString stringWithFormat:@"Predator%d",i+1]];
            [self.forestResidents addObject:predator];
//#ifdef DEBUG
//            NSLog(@"%@",predator);
//#endif
        }
        for(int i=0;i<nHerbivorous;i++){
            Herbivorous *herbivorous = [[Herbivorous alloc]initWithName:[NSString stringWithFormat:@"Herbivorous%d",i+1]];
            [self.forestResidents addObject:herbivorous];
//#ifdef DEBUG
//            NSLog(@"%@",herbivorous);
//#endif
        }
        for(int i=0; i < nGarbage; i++){
            Garbage *garbage = [[Garbage alloc]init];
            [self.forestResidents addObject:garbage];
//#ifdef DEBUG
//            NSLog(@"%@",garbage);
//#endif
        }
        
    }
    return self;
}

- (void)simulateDay{
    while ([self hasMoreThanOnePredator] || [self hasHerbivorous]) {
        int ifirst = arc4random()%[self.forestResidents count];
        int iSecond = arc4random()%[self.forestResidents count];
        id firstResident = self.forestResidents[ifirst];
        id secondResident = self.forestResidents[iSecond];
        if(firstResident != secondResident){
            double calories;
            if ([RulesOfLife canEatFirst:firstResident andSecond:secondResident andGetCalories:&calories]) {
                Animal *animal = firstResident;
                [animal eat:secondResident WithCalories:calories];
#ifdef DEBUG
                NSLog(@"%@ ate %@", firstResident,secondResident);
#endif
            }
        }
    }
    [self print];
}

- (BOOL)hasMoreThanOnePredator{
    int count = 0;
    for(id resident in self.forestResidents){
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
    for(id resident in self.forestResidents){
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

- (void)print{
    NSLog(@"\n\nPRINT!!!!!\n\n");
    for (id resident in self.forestResidents) {
        if ([resident isKindOfClass:[Predator class]]) {
            [((Predator *)resident) printStomach];
        } else if ([resident isKindOfClass:[Garbage class]]){
            NSLog(@"Garbage");
        } else{
            NSLog(@"%@", resident);
        }
    }
}
@end

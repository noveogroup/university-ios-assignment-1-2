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

static const int nGrass = 1;
static const int nPredator = 2;
static const int nHerbivorous = 1;
static const int nGarbage = 1;

@interface Forest ()

//жители леса
@property (nonatomic) NSMutableArray *forestResidents;

@end


@implementation Forest

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
        _forestResidents = [NSMutableArray array];
    }
    return self;
}

- (void)generate{
    NSLog(@"Generate start");
    for(int i=0;i<nGrass;i++){
        Grass *grass = [[Grass alloc]initWithName:[NSString stringWithFormat:@"Grass%d",i+1]];
        [self.forestResidents addObject:grass];
        NSLog(@"%@",grass);
    }
    for(int i=0;i<nPredator;i++){
        Predator *predator = [[Predator alloc]initWithWeight:ABS((BOOL)arc4random()%100) + 50 andName:[NSString stringWithFormat:@"Predator%d",i+1]];
        [self.forestResidents addObject:predator];
        NSLog(@"%@",predator);
    }
    for(int i=0;i<nHerbivorous;i++){
        Herbivorous *herbivorous = [[Herbivorous alloc]initWithName:[NSString stringWithFormat:@"Herbivorous%d",i+1]];
        [self.forestResidents addObject:herbivorous];
        NSLog(@"%@",herbivorous);
    }
    for(int i=0; i < nGarbage; i++){
        Garbage *garbage = [[Garbage alloc]init];
        [self.forestResidents addObject:garbage];
        NSLog(@"%@",garbage);
    }
    NSLog(@"Generate end\n\n");
}

- (void)simulateDay{
    [self generate];
    while ([self countPredators] > 1|| [self countHerbivorous]) {
        int ifirst = arc4random()%[self.forestResidents count];
        int iSecond = arc4random()%[self.forestResidents count];
        id firstResident = self.forestResidents[ifirst];
        id secondResident = self.forestResidents[iSecond];
        if(firstResident != secondResident){
            double calories;
            if ([RulesOfLife canEatFirst:firstResident andSecond:secondResident andGetCalories:&calories]) {
                Animal *animal = firstResident;
                [animal eat:secondResident withCalories:calories];
                [self.forestResidents removeObject:secondResident];
#ifdef DEBUG
                NSLog(@"%@ ate %@", firstResident,secondResident);
#endif
            }
        }
    }
    [self print];
}

- (NSInteger)countPredators{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [Predator class]];
    NSArray* predicateResults = [self.forestResidents filteredArrayUsingPredicate:predicate];
    return [predicateResults count];
}

- (NSInteger)countHerbivorous{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [Herbivorous class]];
    NSArray* predicateResults = [self.forestResidents filteredArrayUsingPredicate:predicate];
    return [predicateResults count];
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

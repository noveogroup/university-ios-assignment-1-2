//
//  Animal.m
//  FirstApp
//
//  Created by Admin on 07.07.16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Animal.h"

@interface Animal ()
@property (nonatomic) double calories;
@property (nonatomic) NSMutableArray *stomach;
@end

@implementation Animal

-(void)eat:(id<Calorific>)food WithCalories:(double)calories{
    self.calories += calories;
    [self.stomach addObject:food];
    [[Forest sharedInstance].forestResidents removeObject:food];
}

-(void)printStomach{
    NSLog(@"\n\nStomach of %@:", self);
    if([self.stomach count]){
        for (id resident in self.stomach) {
            NSLog(@"%@", resident);
            if([resident isKindOfClass:[Animal class]]){
                [resident printStomach];
            }
        }
    } else{
        NSLog(@"is empty");
    }
}

@end

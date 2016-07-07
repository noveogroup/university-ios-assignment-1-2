//
//  Animal.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Animal.h"

@interface Animal ()

@property int calories;
@property NSMutableArray *stomach;

@end


@implementation Animal

- (instancetype)initWithName:(NSString*)name andCalories:(int)calories
{
    self = [super init];
    if (self){
        _name = name;
        _calories = calories;
        _stomach = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)eat:(id<Eatable>)obj
{
    self.calories += [obj giveCalories];
    [self.stomach addObject:obj];
}

- (int)giveCalories
{
    return self.calories/2;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@ with %i calories", self.name, self.calories ];
}

- (void)showStomach
{
    NSLog(@"In stomach of %@", [self description]);
    NSLog(@"Begin");
    if ([self.stomach count] != 0)
    {
        for (id obj in self.stomach)
        {
            NSLog(@"%@", [obj description]);
            if ([obj respondsToSelector:@selector(showStomach)]){
                [obj showStomach];
            }
        }
    }
    else NSLog(@"Empty");
    NSLog(@"End");
}

@end

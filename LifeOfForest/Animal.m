//
//  Animal.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Animal.h"

@interface Animal ()

@property (nonatomic) NSInteger numberOfCalories;
@property NSMutableArray *stomach;

@end


@implementation Animal

- (instancetype)init
{
    self = [self initWithName:@"" calories:0];
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [self initWithName:name calories:0];
    return self;
}

- (instancetype)initWithName:(NSString*)name calories:(NSInteger)calories
{
    self = [super init];
    if (self){
        _name = name;
        _numberOfCalories = calories;
        _stomach = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)eat:(id<Eatable>)obj
{
    self.numberOfCalories += [obj calories];
    [self.stomach addObject:obj];
}

- (NSInteger)calories
{
    return self.numberOfCalories/2;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@ with %i calories", self.name, (int)self.numberOfCalories ];
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

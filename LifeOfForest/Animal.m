//
//  Animal.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Animal.h"

static NSString * const kDefaultName = @"";
const NSInteger kDefaultCalories = 0;

@interface Animal ()

@property (nonatomic, readwrite) NSInteger calories;
@property (nonatomic) NSMutableArray *stomach;

@end


@implementation Animal

@synthesize calories = _calories;

- (instancetype)init
{
    self = [self initWithName:kDefaultName calories:kDefaultCalories];
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [self initWithName:name calories:kDefaultCalories];
    return self;
}

- (instancetype)initWithName:(NSString*)name calories:(NSInteger)calories
{
    self = [super init];
    if (self){
        _name = [name copy];
        _calories = calories;
        _stomach = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)eat:(id<Eatable>)obj getCalories:(NSInteger)calories
{
    self.calories += calories;
    [self.stomach addObject:obj];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@ with %i calories", self.name, (int)self.calories];
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

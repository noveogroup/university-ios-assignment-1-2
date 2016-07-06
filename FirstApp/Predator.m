//
//  Predator.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Predator.h"
#import "Herbivorous.h"
#import "Forest.h"

@implementation Predator

-(NSString *)description{
    return [NSString stringWithFormat:@"Predator with name: %@ with weight: %d and calories: %d", self.name, self.weight, self.calories];
}

- (instancetype)initWithWeight:(int)weight andName:(NSString *)name{
    self = [super initWithName:name andCalories:50];
    if(self){
        _weight = weight;
        _stomach = [[NSMutableArray alloc]init];
    }
    return self;
}

- (BOOL)isProtect{
    return (BOOL)arc4random()%2;
}

-(void)eat:(Life *)food{
    self.calories += food.calories/2;
    [self.stomach addObject:food];
    [[Forest sharedInstance] deleteResident:food];
#ifdef DEBUG
    NSLog(@"%@ eat %@", self.name, food.name);
#endif
}


@end

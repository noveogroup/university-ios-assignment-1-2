//
//  Herbivorous.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Herbivorous.h"
#import "Grass.h"
#import "Life.h"
#import "Forest.h"
#import "Garbage.h"

@implementation Herbivorous

-(NSString *)description{
    return [NSString stringWithFormat:@"Herbivorous with name: %@ with calories: %d", self.name, self.calories];
}

-(instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name andCalories:100];
    if(self){
        _stomach = [[NSMutableArray alloc]init];
    }
    return self;
}

-(BOOL)isHide{
    return (BOOL)arc4random()%2;
}

-(void)eat:(Life *)food{
    self.calories +=food.calories;
    [self.stomach addObject:food];
    [[Forest sharedInstance] deleteResident:food];
#ifdef DEBUG
    if([food isKindOfClass:[Garbage class]]){
        NSLog(@"%@ eat garbage", self.name);
    }else{
        NSLog(@"%@ eat %@", self.name, food.name);
    }
    
#endif
}

@end

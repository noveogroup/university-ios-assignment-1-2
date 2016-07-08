//
//  Herbivorous.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Herbivorous.h"
#import "Grass.h"
#import "Forest.h"
#import "Garbage.h"


static const double kDefaultHerbivorousCalories = 50;

@interface Herbivorous ()
@end

@implementation Herbivorous

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with calories: %.1f", self.name, self.calories];
}

-(instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name andCalories:kDefaultHerbivorousCalories];
    if(self){
    }
    return self;
}

-(BOOL)isHide{
    return arc4random()%2 == 0;
}

@end

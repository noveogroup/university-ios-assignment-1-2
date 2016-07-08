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
#import "Naming.h"


static const double kDefaultHerbivorousCalories = 50;

@interface Herbivorous ()
@property (nonatomic) NSString *name;
@end

@implementation Herbivorous

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ with calories: %.1f", self.name, self.calories];
}

-(instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name andCalories:kDefaultHerbivorousCalories];
    if(self){
        _name = name;
    }
    return self;
}

-(BOOL)isHide{
    return (BOOL)arc4random()%2;
}

@end

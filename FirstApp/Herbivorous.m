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

@implementation Herbivorous

-(NSString *)description{
    return [NSString stringWithFormat:@"Herbivorous with name: %@ with calories: %d", self.name, self.calories];
}

- (instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name];
    if(self){
        //калории в начале жизни
        self.calories = 100;
    }
    return self;
}

-(BOOL)isHide{
    return (BOOL)arc4random()%2;
}

-(void)eat:(Life *)food{
    self.calories +=((Grass*)food).calories;
    [super eat:food];
}

@end

//
//  Grass.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Grass.h"

@implementation Grass

-(NSString *)description{
    return [NSString stringWithFormat:@"Grass with name: %@ with calories: %d", self.name, self.calories];
}


-(instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name];
    if(self){
        self.calories = 10;
    }
    return self;
}

@end

//
//  Animal.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Animal.h"
#import "Forest.h"

@implementation Animal

-(instancetype)initWithName:(NSString *)name{
    self = [super initWithName:name];
    if(self){
        self.stomach = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)eat:(Life *)food{
    [self.stomach addObject:food];
    [[Forest sharedInstance] deleteResident:food];
    NSLog(@"%@ eat %@", self.name, food.name);
}

@end

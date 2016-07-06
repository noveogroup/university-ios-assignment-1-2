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

-(instancetype)initWithName:(NSString *)name
                andCalories:(int)calories{
    self = [super initWithName:name andCalories:calories];
    if(self){
        _stomach = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)eat:(Life *)food{
    [self.stomach addObject:food];
    [[Forest sharedInstance] deleteResident:food];
#ifdef DEBUG
    NSLog(@"%@ eat %@", self.name, food.name);
#endif
}

@end

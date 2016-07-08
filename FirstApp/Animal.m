//
//  Animal.m
//  FirstApp
//
//  Created by Admin on 07.07.16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "Animal.h"

@interface Animal ()
@property (nonatomic) NSMutableArray *stomach;
@end

@implementation Animal

-(instancetype)initWithName:(NSString *)name
                andCalories:(double)calories{
    self = [super init];
    if(self){
        _name = name;
        _stomach = [NSMutableArray array];
        _calories = calories;
    }
    return self;
}

-(void)eat:(id<Calorific>)food withCalories:(double)calories{
    self.calories += calories;
    [self.stomach addObject:food];
}

-(void)printStomach{
    NSLog(@"\n\nStomach of %@:", self);
    if([self.stomach count]){
        for (id resident in self.stomach) {
            NSLog(@"%@", resident);
            if([resident respondsToSelector:@selector(printStomach)]){
                [resident printStomach];
            }
        }
    } else{
        NSLog(@"is empty");
    }
}

-(double)calorific{
    return _calories / 2;
}

@end

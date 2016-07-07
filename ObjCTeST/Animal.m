//
//  Animal.m
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"
#import "Forest.h"

@interface Animal ()

@property (nonatomic) float calories;
@property (nonatomic) NSMutableArray *stomach;

@end

@implementation Animal

- (void)eat:(id <Calories>)object calories:(float)cal {
    
    self.calories += cal;
    [self.stomach addObject:object];
    [[Forest sharedForest].objects removeObject:object];
}

@end

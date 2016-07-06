//
//  Predator.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Predator.h"
#import "Forest.h"

#define MIN_WEIGHT 10
#define MAX_WEIGHT 200

@interface Predator ()

@property NSString *name;
@property float calories;
@property float weight;

@end

@implementation Predator

@synthesize name;
@synthesize calories;
@synthesize weight;
@synthesize stomach;

- (instancetype)init {
    
    self = [self initWithName:[NSString stringWithFormat:@"Predator %@", [NSDate date]] andWeight:(MIN_WEIGHT + arc4random() % (MAX_WEIGHT - MIN_WEIGHT))];
    return self;
}

- (instancetype)initWithName:(NSString *)theName {
    
    self = [self initWithName:theName
                    andWeight:(MIN_WEIGHT + arc4random() % (MAX_WEIGHT - MIN_WEIGHT))];
    return self;
}

- (instancetype)initWithName:(NSString *)theName calories:(float)theCal andWeight:(float)theWeight {
    
    if (self = [super initWithName:theName andCalories:theCal]) {
        
        
        _weight = theWeight;
        _stomach = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BOOL) isDefending {
    
    return arc4random() % 2;
}

- (void)eat:(LivingBeing *)livingBeing {
    
    self.calories += [livingBeing calories] / 2;
    [self.stomach addObject:livingBeing];
    [[Forest sharedForest].livingBeings removeObject:livingBeing];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Predator %@ with weight: %f, calories: %f and stomach: %@",
            self.name, self.weight, self.calories, self.stomach.description];
}

@end




















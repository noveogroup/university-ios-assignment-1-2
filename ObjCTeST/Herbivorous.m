//
//  Herbivorous.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Herbivorous.h"
#import "Forest.h"

@interface Herbivorous ()

@property NSString *name;
@property float calories;

@end

@implementation Herbivorous

@synthesize name;
@synthesize calories;
@synthesize stomach;

- (instancetype)init {
    
    self = [self initWithName:[NSString stringWithFormat:
                               @"Herbivorous %@", [NSDate date]]];
    return self;
}

- (instancetype)initWithName:(NSString *)theName {
    
    if (self = [super initWithName:theName]) {
        
        self.calories = 50;
        self.stomach = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BOOL) isHiding {
    
    return arc4random() % 2;
    
}

- (void)eat:(LivingBeing *)livingBeing {
    
    self.calories += [livingBeing calories];
    [self.stomach addObject:livingBeing];
    [[Forest sharedForest].livingBeings removeObject:livingBeing];
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Herbivorous %@ with calories: %f and stomach: %@",
            self.name, self.calories, self.stomach.description];
}

@end


























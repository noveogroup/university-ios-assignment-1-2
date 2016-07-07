//
//  Herbivorous.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Herbivorous.h"

@interface Herbivorous ()

@property (nonatomic) float calories;
@property (nonatomic) NSMutableArray *stomach;

@end

@implementation Herbivorous

- (instancetype)initWithName:(NSString *)theName {
    
    if (self = [super initWithName:theName]) {
        
        _calories = 50;
        _stomach = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BOOL) isHiding {
    
    return arc4random() % 2;
    
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Herbivorous %@ with calories: %f and stomach: %@", self.name, self.calories, self.stomach.description];
}

@end


























//
//  Predator.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"

@interface Predator : LivingBeing <Animal> {
    
    NSMutableArray *_stomach;
    float _weight;
}

@property (nonatomic, readonly) float weight;

- (instancetype)initWithName:(NSString *)theName andWeight:(float)theWeight;
- (BOOL) isDefending;

@end

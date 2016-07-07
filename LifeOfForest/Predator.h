//
//  Predator.h
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Animal.h"

@interface Predator : Animal

@property (readonly) int weight;

- (BOOL)isProtected;

@end

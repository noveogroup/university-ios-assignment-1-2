//
//  Herbivore.h
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import "Animal.h"

@interface Herbivore : Animal

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

- (BOOL)isHide;

@end

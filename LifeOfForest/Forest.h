//
//  Forest.h
//  LifeOfForest
//
//  Created by admin on 06/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forest : NSObject

+ (Forest*)sharedInstance;

- (BOOL)canFirstCreature:(id)obj1 eatSecondCreature:(id)obj2;
- (int)numberOfHerbivore;
- (int)numberOfPredator;
- (void)daySimulation;

@end
//
//  Creature.h
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger kDefaultPredatorCalories;
extern const NSInteger kDefaultHerbivorousCalories;
extern const NSInteger kDefaultPlantCalories;
extern const NSInteger kDefaultGarbageCalories;

@interface Creature : NSObject

@property (nonatomic, readonly) NSInteger calories;

@end
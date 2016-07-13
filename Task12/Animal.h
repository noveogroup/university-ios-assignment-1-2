//
//  Animal.h
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Creature.h"
#import "Nameable.h"


@protocol Animal <NSObject,Nameable>

@optional
@property(nonatomic,readonly) NSInteger weight;

- (void)eat:(Creature *)creature withCalories:(NSInteger)calories;
- (BOOL)isProtected;

@end


@interface Animal : Creature <Animal>

@property(nonatomic,readonly) NSArray *stomach;

@end


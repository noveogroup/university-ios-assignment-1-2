//
//  Plant.h
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Creature.h"
#import "Nameable.h"

@interface Plant : Creature <Nameable>

- (instancetype)initWithName:(NSString *)aName;

@end
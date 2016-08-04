//
//  Herbivorous.h
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Herbivorous : Animal <Animal>

- (instancetype)initWithName:(NSString *)aName;

@end



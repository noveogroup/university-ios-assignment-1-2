//
//  Herbivorous.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Animal.h"

@interface Herbivorous : LivingBeing <Animal> {
    
    NSMutableArray *_stomach;
}

- (BOOL) isHiding;

@end

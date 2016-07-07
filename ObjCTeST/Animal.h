//
//  Animal.h
//  ObjCTeST
//
//  Created by Admin on 07/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LivingBeing.h"
#import "ForestObject.h"

@interface Animal : LivingBeing {
    
    NSMutableArray *_stomach;
}

- (void)eat:(ForestObject *)object calories:(float)cal;

@end

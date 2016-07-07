//
//  LivingBeing.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ForestObject.h"

@interface LivingBeing : ForestObject {
    
    NSString *_name;
}

@property (nonatomic, readonly, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end








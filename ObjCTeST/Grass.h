//
//  Grass.h
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Named.h"

@interface Grass : NSObject <Calories, Named>

- (instancetype)initWithName:(NSString *)aName;

@end

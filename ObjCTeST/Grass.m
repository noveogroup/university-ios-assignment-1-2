//
//  Grass.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Grass.h"

@implementation Grass

- (float)calories {
    
    return 10;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Grass %@ with calories: %f", self.name, self.calories];
}

@end
















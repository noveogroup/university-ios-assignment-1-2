//
//  Grass.h
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eatable.h"


@interface Grass : NSObject <Eatable>

@property (copy, readonly, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

@end

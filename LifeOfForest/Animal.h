//
//  Animal.h
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eatable.h"

@interface Animal : NSObject <Eatable>

@property (nonatomic, readonly) NSString *name;

- (void)eat:(id<Eatable>)obj;
- (instancetype)initWithName:(NSString *)name calories:(NSInteger)calories NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithName:(NSString *)name;
- (void)showStomach;

@end

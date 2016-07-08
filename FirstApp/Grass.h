//
//  Grass.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calorific.h"

@interface Grass : NSObject <Calorific>

@property (nonatomic, copy) NSString *name;

-(instancetype)initWithName:(NSString *)name;

@end

//
//  Grass.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calorific.h"
#import "Naming.h"

@interface Grass : NSObject <Calorific, Naming>

-(instancetype)initWithName:(NSString *)name;

@end

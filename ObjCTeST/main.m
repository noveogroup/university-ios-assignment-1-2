//
//  main.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Predator.h"
#import "Herbivorous.h"
#import "Grass.h"
#import "Forest.h"
#import "EatingRules.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Forest *forest = [Forest sharedForest];
        
//        [forest.livingBeings addObject:[[Predator alloc] initWithName:@"Tiger" andWeight:100]];
//        
//        [forest.livingBeings addObject:[[Herbivorous alloc] initWithName:@"Zebra"]];
//        
//        [forest.livingBeings addObject:[[Grass alloc] initWithName:@"Daisy"]];
        
        Herbivorous *h = [[Herbivorous alloc] init];
//        [forest simulateDay];
        
    }
    return 0;
}

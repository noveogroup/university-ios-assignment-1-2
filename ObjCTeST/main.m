//
//  main.m
//  ObjCTeST
//
//  Created by Admin on 05/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ForestKit.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Forest *forest = [Forest sharedForest];
        
        [forest.objects addObject:[[Predator alloc] initWithName:@"Lion" andWeight:120]];
        
        [forest.objects addObject:[[Predator alloc] initWithName:@"Tiger" andWeight:100]];
        
        [forest.objects addObject:[[Herbivorous alloc] initWithName:@"Zebra"]];
        
        [forest.objects addObject:[[Herbivorous alloc] initWithName:@"Antelope"]];
        
        [forest.objects addObject:[[Herbivorous alloc] initWithName:@"Pig"]];
        
        [forest.objects addObject:[[Grass alloc] initWithName:@"Daisy01"]];
        
        [forest.objects addObject:[[Grass alloc] initWithName:@"Daisy02"]];
        
        [forest.objects addObject:[[Grass alloc] initWithName:@"Daisy03"]];
        
        [forest.objects addObject:[[Grass alloc] initWithName:@"Daisy04"]];
        
        [forest.objects addObject:[[Garbage alloc] init]];
        [forest.objects addObject:[[Garbage alloc] init]];
        [forest.objects addObject:[[Garbage alloc] init]];
        
        [forest simulateDay];
        
        Predator *p = [[Predator alloc] initWithName:@"1" andWeight:2];
        Herbivorous *h = [[Herbivorous alloc] initWithName:@"2"];
        [p eat:h calories:[h calories]/2];
        NSLog(@"%f", p.calories);
        
        NSLog(@"\n------------\n");
        NSLog(@"In the forest there are only %@", forest.objects);
        
    }
    return 0;
}
















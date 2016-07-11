//
//  main.m
//  LifeOfForest
//
//  Created by admin on 07/07/16.
//  Copyright © 2016 Saveliy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forest.h"

#import "Herbivore.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[Forest sharedInstance] daySimulation];
    }
    return 0;
}

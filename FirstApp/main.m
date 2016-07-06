//
//  main.m
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[Forest sharedInstance] simulateDay];
    
    }
    return 0;
}

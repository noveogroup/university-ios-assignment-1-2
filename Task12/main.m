//
//  main.m
//  Task12
//
//  Created by Sergey Plotnikov on 07.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Симуляция началась");
        [[Forest sharedInstance] simulate];
        NSLog(@"Конец симуляции");
    }
    return 0;
}

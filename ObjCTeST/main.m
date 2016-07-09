#import "ForestKit.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Forest *forest = [Forest sharedForest];
        
        [forest.objects addObject:[[Predator alloc] initWithName:@"Lion" andWeight:120]];
        
        [forest.objects addObject:[[Predator alloc] initWithName:@"Tiger01" andWeight:100]];
        
        [forest.objects addObject:[[Predator alloc] initWithName:@"Tiger02" andWeight:100]];
        
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
        
        NSLog(@"\n------------\n");
        NSLog(@"In the forest there are only one predator:");
        [forest.objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
            
            if ([obj isKindOfClass:[Animal class]]) {
                
                NSLog(@"%@ and stomach:", obj);
                [obj printStomachWith:@"\t"];
                *stop = YES;
            }
        }];
    }
    
    return 0;
}
















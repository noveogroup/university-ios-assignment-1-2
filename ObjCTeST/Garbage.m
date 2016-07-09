#import "Garbage.h"

const NSInteger kGarbageDefaultCalories = -1;

@implementation Garbage

- (float)calories
{
    
    return kGarbageDefaultCalories;
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"Garbage with calories: %g", self.calories];
}

@end

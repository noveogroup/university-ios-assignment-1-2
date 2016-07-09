#import "Herbivorous.h"
#import "Grass.h"
#import "Garbage.h"

const NSInteger kHerbivorousDefaultCalories = 50;

@implementation Herbivorous

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super initWithName:name andCalories:kHerbivorousDefaultCalories]) {
        
    }
    
    return self;
}

- (BOOL) isHiding
{
    return arc4random() % 2 == 0;
}

- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal
{
    if ([object isKindOfClass:[Grass class]] || [object isKindOfClass:[Garbage class]]) {
        
        *cal = object.calories;
        return YES;
    }
    
    return NO;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Herbivorous %@ with calories: %g", self.name, self.calories];
}

@end


























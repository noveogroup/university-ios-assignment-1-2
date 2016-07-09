#import "Forest.h"
#import "Predator.h"
#import "Herbivorous.h"
#import "Garbage.h"
#import "RulesOfEating.h"

@implementation Forest

+ (instancetype)sharedForest
{
    static Forest *forest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        forest = [[Forest alloc] init];
    });
    return forest;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        self.objects = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)simulateDay
{
    while (![self isEnd]) {
        
        u_int32_t i1 = arc4random() % [self.objects count];
        u_int32_t i2 = arc4random() % [self.objects count];
        float cal;
        
        id first = self.objects[i1];
        id second = self.objects[i2];
        
//        if ([first respondsToSelector:@selector(eat:calories:)]) {
        if ([first conformsToProtocol:@protocol(RulesOfEating)]) {
            
            if ([first canEat:second withCalories:&cal]) {
                
                NSLog(@"%@ ate %@", first, second);
                [first eat:second calories:cal];
                [self.objects removeObject:second];
            }
        }
    }
}

- (BOOL)isEnd
{
    int npredators = 0;
    int nherbivorouses = 0;
    int ngarbage = 0;
    
    for (id <Calories> object in self.objects) {
        
        if ([object isKindOfClass:[Predator class]]) {
            
            npredators++;
        }
        else if ([object isKindOfClass:[Herbivorous class]]) {
            
            nherbivorouses++;
        }
        else if ([object isKindOfClass:[Garbage class]]) {
            
            ngarbage++;
        }
    }
    
    if (npredators == 1 && nherbivorouses == 0 && ngarbage == 0) {
        
        return YES;
    }
    
    return NO;
}

@end
















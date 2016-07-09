#import "Calories.h"

@protocol RulesOfEating <NSObject>

- (BOOL)canEat:(id <Calories>)object withCalories:(float *)cal;

@end

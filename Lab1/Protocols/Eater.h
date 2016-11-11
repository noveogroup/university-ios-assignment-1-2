#import <Foundation/Foundation.h>
#import "Calories.h"

@protocol Eater <NSObject>

- (void)eatsAn:(id<Calories>)food;
- (BOOL)canEat:(id<Calories>)item;

@end

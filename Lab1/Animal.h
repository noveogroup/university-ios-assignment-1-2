#import <Foundation/Foundation.h>
#import "Calories.h"
#import "Names.h"


@interface Animal : NSObject <Calories, Names>

- (instancetype)initWithName:(NSString *)name andId:(int)number andCalories:(float)calories;
- (NSString *) showStomach: (NSString *)tab;
- (void)addItem:(id <Calories>)item WithCalories:(float)calories;

@end

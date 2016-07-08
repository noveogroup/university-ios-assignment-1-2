#import "Calories.h"
#import "Named.h"

@interface Animal : NSObject <Calories, Named>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) float calories;
@property (nonatomic, readonly) NSMutableArray *stomach;

- (instancetype)initWithName:(NSString *)name andCalories:(float)cal;
- (void)eat:(id <Calories>)object calories:(float)cal;
- (void)printStomachWith:(NSString *)tab;

@end

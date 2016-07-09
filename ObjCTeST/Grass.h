#import "Named.h"

@interface Grass : NSObject <Calories, Named>

- (instancetype)initWithName:(NSString *)name;

@end

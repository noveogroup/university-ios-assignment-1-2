#import "Calories.h"
#import "Names.h"

@interface Plant : NSObject <Names, Calories>

- (instancetype)initWithId:(int)number;

@end

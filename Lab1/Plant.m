#import "Plant.h"
#import "Constants.h"

@implementation Plant

@synthesize name = _name;

- (float)calories
{
    return PLANT_CALORIES;
}

- (instancetype)initWithId:(int)number
{
    if(self = [super init]) {
        _name = [NSString stringWithFormat:@"flower_%d", number];
    }
    return  self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end

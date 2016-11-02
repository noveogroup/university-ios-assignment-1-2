#import "Plant.h"
#import "Constants.h"

@implementation Plant

@synthesize name = _name;

-(id)init
{
    if(self = [super init]) {
        self.calories = @(PLANT_CALORIES);
        self.name = @"defaultPlant";
    }
    return  self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@", self.name];
}

@end

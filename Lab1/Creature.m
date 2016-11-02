#import "Creature.h"

@implementation Creature


-(id)init
{
    
    self = [super init];
    if(self) {
        _calories = @-1;
    }
    return  self;
}

@end

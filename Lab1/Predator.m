#import "Predator.h"
#import "Constants.h"
#import "Garbage.h"

@implementation Predator

@synthesize weight;

-(id)init {
    if(self = [super init]) {
        self.calories = @(PREDATOR_CALORIES);
        self.name = @"defaultPredator";
        self.weight = @(arc4random_uniform(100));
        _stomach = [[NSMutableArray alloc] init];
    }

    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with %@ calories and %@ kg", self.name, self.calories, self.weight];
}

-(BOOL)isDefending
{
    return (arc4random_uniform(3) + 1) % 3 == 0;
}

-(void)eatsAn:(Creature*)food {
//    if([food isMemberOfClass:[Garbage class]]) {
//        self.calories = @([self.calories floatValue] + [food.calories floatValue]);
//    } else {
//        self.calories = @([self.calories floatValue] + [food.calories floatValue] / 2);
//    }

    self.calories = @([self.calories floatValue] + [food.calories floatValue] / (1 + (int)![food isMemberOfClass:[Garbage class]]));
    [_stomach addObject:food];
    NSLog(@"%@ has eaten a %@ with %@ calories. And now it has %@ calories.", [self className], [food className], food.calories, self.calories);
}


@end

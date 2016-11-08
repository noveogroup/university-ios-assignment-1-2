#import "Herbivorous.h"
#import "Constants.h"

@implementation Herbivorous

-(id)init
{
    if(self = [super init]) {
        self.calories = @(HERBIVOROUS_CALORIES);
        self.name = @"defaultHerbivorous";
        _stomach = [[NSMutableArray alloc] init];
    }
    return  self;
}

-(BOOL)isHiding
{
    return (BOOL) arc4random_uniform(2);
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with %@ calories", self.name, self.calories];
}

-(void)eatsAn:(Creature*)food {
    self.calories = @([self.calories floatValue] + [food.calories floatValue]);
    [_stomach addObject:food];
    NSLog(@"%@ has eaten a %@ with %@ calories. And now it has %@ calories.", [self name], [food className], food.calories, self.calories);

}

@end

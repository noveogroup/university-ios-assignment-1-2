#import "Herbivorous.h"
#import "Constants.h"
#import "Plant.h"
#import "Garbage.h"

@implementation Herbivorous

- (instancetype)initWithId:(int)number
{
    return [super initWithName:@"Herbivorous" andId:number andCalories:HERBIVOROUS_CALORIES];
}

-(BOOL)isHiding
{
    return (BOOL) arc4random_uniform(2);
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with %f calories", self.name, self.calories];
}

- (BOOL)canEat:(id<Calories>)item
{
    if ([item isMemberOfClass:[Plant class]]) {
            return YES;
    }
    
    return [item isMemberOfClass:[Garbage class]];
}

-(void)eatsAn:(id<Calories>)food {
    [self addItem:food WithCalories:food.calories];
    NSLog(@"%@ has eaten a %@ with %f calories. And now it has %f calories.", [self name], [(NSObject *)food className], food.calories, self.calories);

}

@end

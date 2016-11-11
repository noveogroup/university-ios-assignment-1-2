#import "Predator.h"
#import "Constants.h"
#import "Garbage.h"
#import "Herbivorous.h"

@interface Predator ()

@property (nonatomic) NSNumber *weight;

@end

@implementation Predator

- (instancetype)initWithId:(int)number
{
    if(self = [super initWithName:@"predator" andId:number andCalories:PREDATOR_CALORIES]) {
        _weight = @(arc4random_uniform(100));
     }

    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with %f calories and %@ kg", self.name, self.calories, self.weight];
}

-(BOOL)isDefending
{
    return (arc4random_uniform(3) + 1) % 3 == 0;
}

- (BOOL)canEat:(id <Calories>)item
{
   
    if ([item isMemberOfClass:[Predator class]]) {
        return (![(Predator *) item isDefending]) && (self.weight > [(Predator *)item weight]);
    }
    if ([item isMemberOfClass:[Herbivorous class]]) {
        return ![(Herbivorous *) item isHiding];
    }
    
    return [item isMemberOfClass:[Garbage class]];

}

- (void)eatsAn:(id<Calories>)food
{
    if([food isMemberOfClass:[Garbage class]]) {
         [self addItem:food WithCalories:food.calories];
    } else {
        [self addItem:food WithCalories:food.calories / 2];
    }
    NSLog(@"%@ has eaten a %@ with %f calories. And now it has %f calories.", [self className], [(NSObject *)food className], food.calories, self.calories);
}


@end

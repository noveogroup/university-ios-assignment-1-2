#import "Animal.h"

@interface Animal ()

@property (nonatomic) NSMutableArray *stomach;
@property (nonatomic) float calories;

@end

@implementation Animal

@synthesize name = _name;

- (instancetype)initWithName:(NSString *)name andId:(int)number andCalories:(float)calories
{
    if(self = [super init]) {
        _name = [NSString stringWithFormat:@"%@_%d", name, number];
        _calories = calories;
        _stomach = [[NSMutableArray alloc] init];
    }
    return  self;
}

- (void)addItem:(id <Calories>)item WithCalories:(float)calories
{
    [self.stomach addObject:item];
    self.calories += calories;
}

-(NSString *)showStomach: (NSString *)tab {
    NSString *str = [NSString stringWithFormat:@"%@%@: \n", tab, self.name];
    tab = [NSString stringWithFormat:@"%@   ", tab];

    if (_stomach.count == 0){
        str = [NSString stringWithFormat:@"%@%@Empty\n", str, tab];
    } else {
        for (Animal *item in _stomach) {
            if ([item isKindOfClass:[Animal class]]) {
                str = [NSString stringWithFormat:@"%@%@", str,[(Animal *) item showStomach:tab]];
            } else {
                str = [NSString stringWithFormat:@"%@%@%@\n", str, tab, item.description];
            }
        }
    }
    return str;
}

@end

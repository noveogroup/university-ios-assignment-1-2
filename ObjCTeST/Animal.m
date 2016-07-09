#import "Animal.h"

@interface Animal ()

@property (nonatomic) NSString *name;
@property (nonatomic) float calories;
@property (nonatomic) NSMutableArray *stomach;

@end

@implementation Animal

- (instancetype)initWithName:(NSString *)name andCalories:(float)cal
{
    if (self = [super init]) {
        
        _name = name;
        _calories = cal;
        _stomach = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)eat:(id <Calories>)object calories:(float)cal
{
    self.calories += cal;
    [self.stomach addObject:object];
}

- (void)printStomachWith:(NSString *)tab
{
    [self.stomach enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        
        NSLog(@"%@%@ and stomach: ", tab, obj);
        if ([obj respondsToSelector:@selector(printStomachWith:)]) {
            
            [obj printStomachWith:[tab stringByAppendingString:tab]];
        }
    }];
}

@end

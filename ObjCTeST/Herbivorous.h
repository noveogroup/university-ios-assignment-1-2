#import "Animal.h"
#import "RulesOfEating.h"

@interface Herbivorous : Animal <RulesOfEating>

- (BOOL) isHiding;
- (instancetype)initWithName:(NSString *)name;

@end

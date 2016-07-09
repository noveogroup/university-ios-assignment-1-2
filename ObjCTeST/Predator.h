#import "Animal.h"
#import "RulesOfEating.h"

@interface Predator : Animal <RulesOfEating>

@property (nonatomic, readonly) float weight;

- (instancetype)initWithName:(NSString *)name andWeight:(float)weight;
- (BOOL)isDefending;

@end

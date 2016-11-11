#import "Animal.h"
#import "Eater.h"

@interface Herbivorous : Animal <Eater>

- (instancetype)initWithId:(int)number;
- (BOOL)isHiding;

@end

#import "Animal.h"
#import "Eater.h"

@interface Predator : Animal <Eater>

- (id)initWithId:(int)number;


@end

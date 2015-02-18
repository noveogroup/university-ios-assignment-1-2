#import "NSSetCategory.h"

@implementation NSSet (NSSetCategory)

- (NSSet *)setByRemovingObject:(id)anObject {
    NSMutableSet *tempMutableCopy = [self mutableCopy];
    [tempMutableCopy removeObject:anObject];
    return [tempMutableCopy copy];
}

@end
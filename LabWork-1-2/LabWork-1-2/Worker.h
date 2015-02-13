#import "Human.h"

@interface Worker : Human

@property (strong, nonatomic) NSNumber *salary;

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age salary:(NSNumber *)salary;

@end

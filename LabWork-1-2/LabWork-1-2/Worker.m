#import "Worker.h"

@implementation Worker

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age salary:(NSNumber *)salary {
    self = [self initWithName:name age:age];
    if (self != nil) {
        _salary = salary;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@}>", [self className], self.name, self.age, self.salary];
}

@end

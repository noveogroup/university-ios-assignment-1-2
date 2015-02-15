#import "Human.h"

@implementation Human

+ (instancetype)humanWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

+ (instancetype)humanWithName:(NSString *)name age:(NSNumber *)age {
    return [[self alloc] initWithName:name age:age];
}

- (instancetype)init {
    self = [super init];
    [[[PlaceOfEducationalProcess alloc] init] addParticipant:self];
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name age:nil];
}

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age {
    if (self = [self init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@}>", [self className], self.name, self.age];
}

@end
#import "University.h"

@implementation University

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _headsOfTheChairs = [[NSMutableSet alloc] init];
        _teachers = [[NSMutableSet alloc] init];
        _students = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addParticipant:(id)participant {
    if ([participant isKindOfClass:[HeadOfTheChair class]]) {
        [self.headsOfTheChairs addObject:participant];
    }
    else if ([participant isKindOfClass:[Teacher class]]) {
        [self.teachers addObject:participant];
    }
    else if ([participant isKindOfClass:[Student class]]) {
        [self.students addObject:participant];
    }
    else {
        NSLog(@"Unknown class of participant: %@.", [participant class]);
    }
}

- (void)removeParticipant:(id)participant {
    if ([participant isKindOfClass:[HeadOfTheChair class]]) {
        [self.headsOfTheChairs removeObject:participant];
    }
    else if ([participant isKindOfClass:[Teacher class]]) {
        [self.teachers removeObject:participant];
    }
    else if ([participant isKindOfClass:[Student class]]) {
        [self.students removeObject:participant];
    }
    else {
        NSLog(@"Unknown class of participant: %@.", [participant class]);
    }
}

+ (instancetype)sharedInstance {
    static University *_sharedInstance = nil;
    @synchronized(self) {
        if (_sharedInstance == nil) {
            _sharedInstance = [[University alloc] init];
        }
    }
    return _sharedInstance;
}

@end

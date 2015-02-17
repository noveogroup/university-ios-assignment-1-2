#import "University.h"

@implementation University

- (void)addParticipant:(id)participant {
    if ([participant isKindOfClass:[HeadOfTheChair class]]) {
        if (self.headsOfTheChairs == nil) {
            self.headsOfTheChairs = [[NSMutableSet alloc] init];
        }
        [self.headsOfTheChairs addObject:participant];
    }
    else if ([participant isKindOfClass:[Teacher class]]) {
        if (self.teachers == nil) {
            self.teachers = [[NSMutableSet alloc] init];
        }
        [self.teachers addObject:participant];
    }
    else if ([participant isKindOfClass:[Student class]]) {
        if (self.students == nil) {
            self.students = [[NSMutableSet alloc] init];
        }
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

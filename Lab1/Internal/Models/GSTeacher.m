
#import "GSTeacher.h"

@interface GSTeacher ()

@property (strong, nonatomic) id<participantInTheLearningProcess> master;

@end

@implementation GSTeacher

- (instancetype)initRand
{
    self = [super initRand];
    if (self) {
        _master = nil;
        _salary = 20000 + arc4random()%50000;
        _expirience = arc4random()%25;
    }
    return self;
}

#pragma mark - participant protocol
- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
}

- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
}

- (void) setMaster:(id<participantInTheLearningProcess>) master{
    if (self.master) {
        [self removeMaster];
    }
    
    self.master = master;
    [self.master addDependent:self];
}

- (void) removeMaster{
    if (self.master) {
        [self.master removeDependent:self];
        self.master = nil;
    }
}

- (NSArray*) getDependents{
    return nil;
}

- (id<participantInTheLearningProcess>) getMaster{
    if (self.master) {
        return self.master;
    } else {
        return nil;
    }
}


@end

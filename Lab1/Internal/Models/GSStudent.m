
#import "GSStudent.h"

@interface GSStudent ()

@property (strong, nonatomic) id<participantInTheLearningProcess> master;

@end

@implementation GSStudent

- (instancetype)initRand
{
    self = [super initRand];
    if (self) {
        _averageScore = ((float)(arc4random()%301+200))/100;
        _master = nil;
    }
    return self;
}

- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore
{
    self = [super initWithName:name age:age];
    if (self) {
        _averageScore = averageScore;
        _master = nil;
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


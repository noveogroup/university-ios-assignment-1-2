
#import "GSStudent.h"

#import "GSGroup.h"

@interface GSStudent ()


@end

@implementation GSStudent

- (instancetype)initRand
{
    self = [super initRand];
    if (self) {
        _averageScore = ((float)(arc4random()%301+200))/100;
        _group = nil;
    }
    return self;
}

- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore
{
    self = [super initWithName:name age:age];
    if (self) {
        _averageScore = averageScore;
        _group = nil;
    }
    return self;
}

#pragma mark - participant protocol
- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
}

- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
}

- (void) setMaster:(id<participantInTheLearningProcess>) master{
    if ([master isKindOfClass:[GSGroup class]]) {
        if (self.group) {
            [self removeMaster];
        }
        
        _group = master;
        [self.group addDependent:self];
    }
}

- (void) removeMaster{
    if (self.group) {
        [self.group removeDependent:self];
        _group = nil;
    }
}

- (NSArray*) getDependents{
    return nil;
}

- (id<participantInTheLearningProcess>) getMaster{
    if (self.group) {
        return self.group;
    } else {
        return nil;
    }
}

#pragma mark - description

- (NSString *)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"student %@", self.name];
    
    [description appendFormat:@"\n    Group: %ld", self.group.number];
    
    return [NSString stringWithString:description];
}

@end


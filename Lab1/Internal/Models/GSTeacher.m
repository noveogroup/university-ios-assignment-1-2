
#import "GSTeacher.h"

#import "GSGroup.h"


@interface GSTeacher ()

@end

@implementation GSTeacher

- (instancetype)initRand
{
    self = [super initRand];
    if (self) {
        _group = nil;
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
     NSMutableString* description = [NSMutableString stringWithFormat:@"teacher %@", self.name];
 
     [description appendFormat:@"\n    Group: %ld", self.group.number];
 
     return [NSString stringWithString:description];
 }


@end

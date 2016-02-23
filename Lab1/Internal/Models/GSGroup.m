
#import "GSGroup.h"

@interface GSGroup ()

@property (strong, nonatomic) NSMutableArray<GSTeacher*> *teachers;
@property (strong, nonatomic) NSMutableArray<GSStudent*> *students;
@property (strong, nonatomic) id<participantInTheLearningProcess> master;

@end

@implementation GSGroup

- (instancetype)init
{
    self = [super init];
    if (self) {
        _students = [NSMutableArray array];
        _teachers = [NSMutableArray array];
    }
    return self;
}


#pragma mark - participant protocol
- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
    if ([dependent isKindOfClass:[GSStudent class]] && ![self.students containsObject:dependent]) {
        [self.students addObject:dependent];
        [dependent setMaster:self];
    } else if ([dependent isKindOfClass:[GSTeacher class]] && ![self.teachers containsObject:dependent]) {
        [self.teachers addObject:dependent];
        [dependent setMaster:self];
    }
}

- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
    if ([dependent isKindOfClass:[GSStudent class]] && ![self.students containsObject:dependent]) {
        [self.students addObject:dependent];
        [dependent removeMaster];
    } else if ([dependent isKindOfClass:[GSTeacher class]] && ![self.teachers containsObject:dependent]) {
        [self.teachers addObject:dependent];
        [dependent removeMaster];
    }
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
    if (self.teachers && self.students) {
        NSArray<id<participantInTheLearningProcess>> *tempArray = [NSArray arrayWithArray:self.teachers];
        return [tempArray arrayByAddingObjectsFromArray:self.students];
    } else {
        if (self.teachers) {
            return [self.teachers copy];
        } else {
            return [self.students copy];
        }
        return nil;
    }
}

- (id<participantInTheLearningProcess>) getMaster{
    if (self.master) {
        return self.master;
    } else {
        return nil;
    }
}

@end

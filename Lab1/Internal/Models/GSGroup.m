
#import "GSGroup.h"

#import "GSFaculty.h"

@interface GSGroup ()

@end

@implementation GSGroup

- (instancetype)init
{
    self = [super init];
    if (self) {
        _number = arc4random()%100000;
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
    if (self.faculty) {
        [self removeMaster];
    }
    
    _faculty = master;
    [self.faculty addDependent:self];
}

- (void) removeMaster{
    if (self.faculty) {
        [self.faculty removeDependent:self];
        _faculty = nil;
    }
}

#pragma mark - description

- (NSString *)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"Group with number %ld", self.number];
    
    [description appendFormat:@"\n    students:"];
    for (GSStudent* student in self.students) {
        [description appendFormat:@"\n    %@", student.name];
    }
    
    [description appendFormat:@"\n    teachers:"];
    for (GSStudent* teacher in self.teachers) {
        [description appendFormat:@"\n    %@", teacher.name];
    }
    
    [description appendFormat:@"\n    faculty manager: %@", self.faculty.manager.name];
    
    return [NSString stringWithString:description];
}



@end

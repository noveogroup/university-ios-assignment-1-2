
#import "GSFaculty.h"

@implementation GSFaculty

+(GSFaculty*) sharedFaculty{
    static GSFaculty* faculty = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        faculty = [[GSFaculty alloc] init];
    });
    
    return faculty;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groups = [NSMutableArray array];
    }
    return self;
}

- (float) getAverageScore{
    NSArray* allStudents = [self getAllStudents];
    float averageScore = [[allStudents valueForKeyPath:@"@avg.averageScore"] floatValue];
    return averageScore;
}

- (NSArray*) getAllStudents{
    NSArray* students = [self valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
    return students;
}

#pragma mark - Observing
- (void) turnOnObserving{
    NSArray* allStudents = [self getAllStudents];
    for (GSStudent* student in allStudents) {
        [student addObserver:self
                  forKeyPath:@"averageScore"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    //NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
    
    NSLog(@"avsc = %0.2f", [self getAverageScore]);
}

#pragma mark - participant protocol
- (void) addDependent:(id<participantInTheLearningProcess>) dependent{
    if ([dependent isKindOfClass:[GSGroup class]] && ![self.groups containsObject:dependent]) {
        [self.groups addObject:dependent];
        [dependent setMaster:self];
    }
}
- (void) removeDependent:(id<participantInTheLearningProcess>) dependent{
    if ([dependent isKindOfClass:[GSGroup class]] && [self.groups containsObject:dependent]) {
        [self.groups removeObject:dependent];
        [dependent removeMaster];
    }
}

- (void) setMaster:(id<participantInTheLearningProcess>) master{
    
}
- (void) removeMaster{
}

#pragma mark - description

- (NSString *)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"faculty with manager %@", self.manager.name];
    
    [description appendFormat:@"\ngroups"];
    for (GSGroup* group in self.groups) {
        [description appendFormat:@"\n    group %ld:", group.number];
        [description appendFormat:@"\n        students:"];
        for (GSStudent* student in group.students) {
            [description appendFormat:@"\n            %@", student.name];
        }
        
        [description appendFormat:@"\n        teachers:"];
        for (GSStudent* teacher in group.teachers) {
            [description appendFormat:@"\n            %@", teacher.name];
        }
    }
    
    return [NSString stringWithString:description];
}


@end


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

- (void) addGroup:(GSGroup*) group{
    if (self.groups && ![self.groups containsObject:group]) {
        [self.groups addObject:group];
        
        if (self.manager) {
            for (GSTeacher* teacher in group.teachers) {
                [teacher addMaster:self.manager];
            }
        }
    }
}

- (void) removeGroup:(GSGroup*) group{
    if (self.groups && [self.groups containsObject:group]) {
        [self.groups removeObject:group];
        
        if (self.manager) {
            for (GSTeacher* teacher in group.teachers) {
                [teacher removeMaster:self.manager];
            }
        }
    }
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

@end

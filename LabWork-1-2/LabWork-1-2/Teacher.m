#import "Teacher.h"

@interface Teacher ()

@property (strong, nonatomic) NSMutableSet *superiors;
@property (strong, nonatomic) NSMutableSet *inferiors;

@end

@implementation Teacher

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _students = [[NSMutableSet alloc] init];
    }
    return self;
}

- (NSMutableSet *)superiors {
    return [[NSMutableSet alloc] initWithObjects:self.superior, nil];
}

- (NSMutableSet *)inferiors {
    return self.students;
}

// Add received object to own superiors list and self object to inferiors list of the reveived object
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = (HeadOfTheChair *)participant;
    if (![participant.inferiors containsObject:self]) {
        [participant addInferior:self];
    }
}

// Remove received object from own superiors list and self object from inferiors list of the reveived object
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = nil;
    if ([participant.inferiors containsObject:self]) {
        [participant removeInferior:self];
    }
}

// Add received object to own inferiors list and self object to superiors list of the reveived object
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    [self.students addObject:participant];
    if (![participant.superiors containsObject:self]) {
        [participant addSuperior:self];
    }
}

// Remove received object from own inferiors list and self object from superiors list of the reveived object
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    [self.students removeObject:participant];
    if ([participant.superiors containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *studentsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Student *student in self.students) {
        if (!isFirst) {
            [studentsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [studentsListAsString appendString:student.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@, superior: %@, list of students: [%@]}>", [self className], self.name, self.age, self.salary, self.superior.name, studentsListAsString];
}

@end

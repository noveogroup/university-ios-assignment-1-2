#import "Teacher.h"
#import "HeadOfTheChair.h"

@interface Teacher ()

@property (strong, nonatomic) NSSet *superiors;
@property (strong, nonatomic) NSSet *inferiors;

@end

@implementation Teacher

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _students = [[NSSet alloc] init];
    }
    return self;
}

- (NSSet *)superiors {
    return [[NSSet alloc] initWithObjects:self.superior, nil];
}

// Add received object to own superiors list and self object to inferiors list of the received object
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = (HeadOfTheChair *)participant;
    if (![participant.inferiors containsObject:self]) {
        [participant addInferior:self];
    }
}

// Remove received object from own superiors list and self object from inferiors list of the received object
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant {
    _superior = nil;
    if ([participant.inferiors containsObject:self]) {
        [participant removeInferior:self];
    }
}

// Add received object to own students list and self object to superiors list of the received object
- (void)addStudent:(id<ParticipantOfEducationalProcess>)participant {
    _students = [self.students setByAddingObject:participant];
    if (![participant.superiors containsObject:self]) {
        [participant addSuperior:self];
    }
}

// Remove received object from own students list and self object from superiors list of the received object
- (void)removeStudent:(id<ParticipantOfEducationalProcess>)participant {
    NSMutableSet *tempSet = [self.students mutableCopy];
    [tempSet removeObject:participant];
    _students = tempSet;
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

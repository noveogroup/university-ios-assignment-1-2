#import "HeadOfTheChair.h"
#import "Teacher.h"

@interface HeadOfTheChair ()

@property (strong, nonatomic) NSSet *superiors;

@end

@implementation HeadOfTheChair

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _inferiors = [[NSSet alloc] init];
    }
    return self;
}

// Add received object to own inferiors list and self object to superiors list of the reveived object
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant {
    _inferiors = [self.inferiors setByAddingObject:participant];
    if (![participant.superiors containsObject:self]) {
        [participant addSuperior:self];
    }
}

// Remove received object from own inferiors list and self object from superiors list of the reveived object
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant {
    NSMutableSet *tempSet = [self.inferiors mutableCopy];
    [tempSet removeObject:participant];
    _inferiors = tempSet;
    if ([participant.superiors containsObject:self]) {
        [participant removeSuperior:self];
    }
}

- (NSString *)description {
    NSMutableString *inferiorsListAsString = [NSMutableString stringWithString:@""];
    BOOL isFirst = YES;
    for (Teacher *teacher in self.inferiors) {
        if (!isFirst) {
            [inferiorsListAsString appendString:@", "];
        }
        else {
            isFirst = NO;
        }
        [inferiorsListAsString appendString:teacher.name];
    }
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, salary: %@, list of inferiors: [%@]}>", [self className], self.name, self.age, self.salary, inferiorsListAsString];
}

@end

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage {
    self = [self initWithName:name age:age];
    self.gradePointAverage = gradePointAverage;
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: {name: %@, age: %@, GPA: %@}>", [self className], self.name, self.age, self.gradePointAverage];
}

@end

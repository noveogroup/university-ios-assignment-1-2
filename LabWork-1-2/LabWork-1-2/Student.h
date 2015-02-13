#import "Human.h"

@interface Student : Human

@property (strong, nonatomic) NSNumber *gradePointAverage;
@property (weak, nonatomic) NSSet *teachersList;

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age gradePointAverage:(NSNumber *)gradePointAverage;

@end
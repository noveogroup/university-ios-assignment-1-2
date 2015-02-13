#import "Human.h"

@interface Student : Human

@property (strong, nonatomic) NSNumber *gradePointAverage;
@property (weak, nonatomic) NSSet *teachersList;

@end
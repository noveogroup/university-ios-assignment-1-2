
#import <Foundation/Foundation.h>

#import "GSTeacher.h"
#import "GSStudent.h"

@class GSFaculty;

@interface GSGroup : NSObject <participantInTheLearningProcess>


@property (assign, nonatomic) NSInteger number;

@property (strong, nonatomic) NSMutableArray<GSTeacher*> *teachers;
@property (strong, nonatomic) NSMutableArray<GSStudent*> *students;
@property (strong, nonatomic) GSFaculty* faculty;

@end

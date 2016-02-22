
#import <Foundation/Foundation.h>

#import "GSTeacher.h"
#import "GSStudent.h"

@interface GSGroup : NSObject

@property (strong, nonatomic) NSMutableArray<GSTeacher*> *teachers;
@property (strong, nonatomic) NSMutableArray<GSStudent*> *students;

- (void) addStudent:(GSStudent*) student;
- (void) removeStudent:(GSStudent*) student;

- (void) addTeacher:(GSTeacher*) teacher;
- (void) removeTeacher:(GSTeacher*) teacher;

@end

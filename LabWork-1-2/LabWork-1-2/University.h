#import <Foundation/Foundation.h>
#import "PlaceOfEducationalProcess.h"
#import "HeadOfTheChair.h"
#import "Teacher.h"
#import "Student.h"

@interface University : NSObject <PlaceOfEducationalProcess>

@property (strong, nonatomic) NSMutableSet *headsOfTheChairs;
@property (strong, nonatomic) NSMutableSet *teachers;
@property (strong, nonatomic) NSMutableSet *students;

+ (instancetype)sharedInstance;

@end
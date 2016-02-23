
#import <Foundation/Foundation.h>

#import "participantProtocol.h"

@interface GSHuman : NSObject <participantInTheLearningProcess>

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age;

//- (NSString *)description;

@end

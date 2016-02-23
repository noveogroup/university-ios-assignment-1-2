
#import "GSStudent.h"

@implementation GSStudent

- (instancetype)initRand
{
    self = [super initRand];
    if (self) {
        _averageScore = ((float)(arc4random()%301+200))/100;
    }
    return self;
}

- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore
{
    self = [super initWithName:name age:age];
    if (self) {
        _averageScore = averageScore;
    }
    return self;
}

@end

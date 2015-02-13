#import "Worker.h"
#import "HeadOfTheChair.h"

@interface Teacher : Worker

@property (weak, nonatomic) NSSet *studentsList;
@property (weak, nonatomic) HeadOfTheChair* superior;

@end
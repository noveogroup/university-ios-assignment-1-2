#import <Foundation/Foundation.h>
#import "PlaceOfEducationalProcess.h"

@interface Human : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *age;

+ (instancetype)humanWithName:(NSString *)name;
+ (instancetype)humanWithName:(NSString *)name age:(NSNumber *)age;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age;

@end
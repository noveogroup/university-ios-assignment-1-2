#import <Foundation/Foundation.h>

@interface Human : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *age;

+ (instancetype)humanWithName:(NSString *)name;
+ (instancetype)humanWithName:(NSString *)name age:(NSNumber *)age;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age;

@end
@protocol PlaceOfEducationalProcess

@required
- (void)addParticipant:(id)participant;
- (void)removeParticipant:(id)participant;

@end

#import <Foundation/Foundation.h>

@interface PlaceOfEducationalProcess : NSObject <PlaceOfEducationalProcess>

+ (void)setPlaceDelegate:(id<PlaceOfEducationalProcess>)placeDelegate;

@end
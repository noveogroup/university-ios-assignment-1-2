//
//  EducationalProcessParticipant.h
//  University
//
//  Created by Oleg Sannikov on 2/16/16.
//  Copyright © 2016 Oleg Sannikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EducationalProcessParticipant <NSObject>

@required
@property (copy, nonatomic, readonly) NSSet <id<EducationalProcessParticipant>> *supers;
@property (copy, nonatomic, readonly) NSSet <id<EducationalProcessParticipant>> *subs;

- (void)addSuper:(id<EducationalProcessParticipant>)sup;
- (void)addSub:(id<EducationalProcessParticipant>)sub;
- (void)addSupers:(NSArray <id<EducationalProcessParticipant>> *)supers;
- (void)addSubs:(NSArray <id<EducationalProcessParticipant>> *)subs;

@optional
- (void)removeSuper:(id<EducationalProcessParticipant>)sup;
- (void)removeSub:(id<EducationalProcessParticipant>)sub;

@end

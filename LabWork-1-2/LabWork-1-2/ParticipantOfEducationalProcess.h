@protocol ParticipantOfEducationalProcess

@optional
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant;

@required
- (NSSet *)getSuperiorsList;
- (NSSet *)getInferiorsList;

@end
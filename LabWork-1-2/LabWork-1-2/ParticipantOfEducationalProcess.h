@protocol ParticipantOfEducationalProcess

@property (strong, nonatomic, readonly) NSSet *superiors;
@property (strong, nonatomic, readonly) NSSet *inferiors;

@optional
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant;

@end
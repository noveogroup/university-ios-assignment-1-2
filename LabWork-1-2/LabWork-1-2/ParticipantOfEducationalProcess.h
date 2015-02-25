@class DepartmentOfUniversity;

@protocol ParticipantOfEducationalProcess

@property (strong, nonatomic, readonly) NSSet *superiors;
@property (strong, nonatomic, readonly) NSSet *inferiors;
@property (strong, nonatomic, readonly) NSSet *students;
@property (weak, nonatomic, readonly) DepartmentOfUniversity *department;

@optional
- (void)addSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)addInferior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeSuperior:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeInferior:(id<ParticipantOfEducationalProcess>)participant;
- (void)addStudent:(id<ParticipantOfEducationalProcess>)participant;
- (void)removeStudent:(id<ParticipantOfEducationalProcess>)participant;

@end
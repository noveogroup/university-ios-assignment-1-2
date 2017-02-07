
#import "ViewController.h"

#import "GSFaculty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GSFaculty* faculty = [GSFaculty sharedFaculty];
    
    GSManager* manager = [[GSManager alloc] initWithName:@"BigBoss" age:50];
    [faculty setManager:manager];
    
    //first group
    GSGroup* firstGroup = [[GSGroup alloc] init];
    
    GSStudent* student1 = [[GSStudent alloc] initRand];
    GSStudent* student2 = [[GSStudent alloc] initRand];
    GSStudent* student3 = [[GSStudent alloc] initRand];
    GSStudent* student4 = [[GSStudent alloc] initRand];
    GSStudent* student5 = [[GSStudent alloc] initRand];
    
    [firstGroup addDependent:student1];
    [firstGroup addDependent:student2];
    [firstGroup addDependent:student3];
    [firstGroup addDependent:student4];
    [firstGroup addDependent:student5];

    GSTeacher* teacher1 = [[GSTeacher alloc] initWithName:@"Teacher1" age:40];
    [firstGroup addDependent:teacher1];
    
    [faculty addDependent:firstGroup];
    
    //second group
    GSGroup* secondGroup = [[GSGroup alloc] init];
    
    GSStudent* student6 = [[GSStudent alloc] initRand];
    GSStudent* student7 = [[GSStudent alloc] initRand];
    GSStudent* student8 = [[GSStudent alloc] initRand];
    GSStudent* student9 = [[GSStudent alloc] initRand];
    GSStudent* student10 = [[GSStudent alloc] initRand];
    
    [secondGroup addDependent:student6];
    [secondGroup addDependent:student7];
    [secondGroup addDependent:student8];
    [secondGroup addDependent:student9];
    [secondGroup addDependent:student10];
    
    GSTeacher* teacher2 = [[GSTeacher alloc] initRand];
    [secondGroup addDependent:teacher2];
    
    [faculty addDependent:secondGroup];

    //description testing
    NSLog(@"%@", student3);
    NSLog(@"%@", teacher2);
    NSLog(@"%@", manager);
    NSLog(@"%@", faculty);
    
    //testing of several thing from KVC
    NSArray* allStudents = [faculty valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
    NSLog(@"all st count %ld", [allStudents count]);
    
    NSNumber* avgAge = [allStudents valueForKeyPath:@"@avg.averageScore"];
    NSLog(@"avsc = %@", avgAge);
    
    //observing
    [faculty turnOnObserving];
    
    student1.averageScore = 5;
    student5.averageScore = 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end

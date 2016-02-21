//
//  Human.m
//  University
//
//  Created by Vik on 13.02.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "Human.h"

@implementation Human

- (Gender)randomGender {
    return arc4random() % 2;
}

- (NSUInteger)randomAgeFromMin:(NSUInteger)min toMax:(NSUInteger)max {
    return arc4random() % (max - min) + min;
}

- (NSString *)randomFemaleFirstName {
    NSArray *firstNames = @[@"Ashly", @"Mareli",
                            @"Dylan", @"Kiersten",
                            @"Marlie", @"Ayla",
                            @"Sydney", @"Jaylyn",
                            @"Aspen", @"Yasmin",
                            @"Nancy", @"Christine",
                            @"Meadow", @"Karina",
                            @"Iyana", @"Hanna",
                            @"Charlize", @"Janessa",
                            @"Sarah", @"Tatiana",
                            @"Elaine", @"Jaiden",
                            @"Sadie", @"Ava",
                            @"Jennifer", @"Danielle",
                            @"Zaniyah", @"Callie",
                            @"Hadley", @"Keira"];
    
    return [firstNames objectAtIndex:arc4random() % firstNames.count];
}



- (NSString *)randomMaleFirstName {
    NSArray *firstNames = @[@"Roman", @"Weston",
                            @"Kyler", @"Cohen",
                            @"Deshawn", @"Conor",
                            @"Mohammed", @"Jace",
                            @"Lamont", @"Aarav",
                            @"Jonas", @"Jamar",
                            @"Fernando", @"Toby",
                            @"Jaime", @"Ronan",
                            @"Rodrigo", @"Chad",
                            @"Caden", @"Karter",
                            @"Kasen", @"Lennon",
                            @"Isaiah", @"Dane",
                            @"Jaydan", @"Ryland",
                            @"Aron", @"Landin",
                            @"Thaddeus", @"Yusuf"];
    
    return [firstNames objectAtIndex:arc4random() % firstNames.count];
}

- (NSString *)randomLastName {
    NSArray *lastNames = @[@"Sanders", @"Warner",
                           @"Wu", @"Burke",
                           @"Bass", @"Russell",
                           @"Lynch", @"Rubio",
                           @"Oneill", @"Hayden",
                           @"Odom", @"Franco",
                           @"Avila", @"Carney",
                           @"Dickerson", @"Velasquez",
                           @"Hale", @"Turner",
                           @"Vasquez", @"Walls",
                           @"Cardenas", @"Golden",
                           @"Todd", @"Schultz",
                           @"Haley", @"Morrison",
                           @"Deleon", @"Davila",
                           @"Kemp", @"Kent"];
    
    return [lastNames objectAtIndex:arc4random() % lastNames.count];
}




@end

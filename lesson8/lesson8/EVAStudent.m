//
//  EVAStudent.m
//  lesson8
//
//  Created by Eugeny on 06/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAStudent.h"

static NSInteger const count = 20;

static NSString *const firstNames[count] = {
  @"Nolan", @"Tami", @"Laticia", @"Creola", @"Enoch",
  @"Marjorie", @"Gertrudis", @"Helga", @"Tilda", @"Elidia",
  @"Misty", @"Kristy", @"Genny", @"Jasmin", @"Tommye",
  @"Kaycee", @"Sunny", @"Luis", @"Shiela", @"Marylouise" };

static NSString *const lastNames[count]  = {
  @"Morelock", @"Clapper", @"Pancake", @"Coldren", @"Aumann",
  @"Barreto", @"Maese", @"Cripps", @"Stalvey", @"Seelig",
  @"Cavin", @"Manzer", @"Smathers", @"Dubberly", @"Zaccaria",
  @"Scranton", @"Usry", @"Murrell", @"Heffley", @"Breit" };

static NSString *const greetings[count]  = {
  @"Hi", @"Hello", @"Good day", @"It's I am", @"What is it?",
  @"Step a side junior.", @"Who are you?", @"I'm fime!", @"What are you wish?", @"Ohhhh....",
  @"I am who I am", @"I'm flying...", @"Don't touch me", @"Come on!..", @"Whaaaat?",
  @"Anybody here?", @"Do you want cup of tea?", @"Captain on a line", @"Let's do it", @"Yeearr...." };

@implementation EVAStudent

#pragma mark - Life cycle

+ (instancetype)createStudentName:(NSString *)aName lastName:(NSString *)lastName andGreeting:(NSString *)aGreeting {
  EVAStudent *student = [EVAStudent new];
  student.name = aName;
  student.lastName = lastName;
  student.greeting = aGreeting;
  return student;
}

+ (NSArray *)generateRandomStudents:(NSUInteger)aCount {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:aCount];
  for (NSUInteger step = 0; step < aCount; step++) {
    [array addObject:[EVAStudent createStudentName:firstNames[arc4random()%count-1]
                                          lastName:lastNames[arc4random()%count-1]
                                       andGreeting:greetings[arc4random()%count-1]]];
  }
  return (NSArray *)array;
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public
#pragma mark - Private
#pragma mark Segue
#pragma mark Animations
#pragma mark - Protocol conformance
#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - NSCopying
#pragma mark - NSObject

@end

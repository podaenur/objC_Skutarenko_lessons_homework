//
//  AppDelegate.m
//  lesson13
//
//  Created by Eugeny on 11/08/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "AppDelegate.h"
#import "EVAStudent.h"
#include "EVAAnotherStudent.h"

typedef void(^EVACallback)(NSString *, NSInteger);

@interface AppDelegate ()

@property (copy) EVACallback callback;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.callback = ^(NSString *name, NSInteger number) {
    NSLog(@"My name is: %@ and I knew number: %d\n", name, number);
  };
  
  [[self createStudentName:@"1.Ira"]    guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  [[self createStudentName:@"2.Kolya"]  guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  [[self createStudentName:@"3.Petya"]  guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  [[self createStudentName:@"4.Darya"]  guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  [[self createStudentName:@"5.Ivan"]   guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  
  EVAAnotherStudent *aStudent = [EVAAnotherStudent new];
  aStudent.name = @"10.Superhero";
  [aStudent guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];

  EVAAnotherStudent *aStudent2 = [EVAAnotherStudent new];
  aStudent2.name = @"11.Superpeach";
  [aStudent2 guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];

  EVAAnotherStudent *aStudent3 = [EVAAnotherStudent new];
  aStudent3.name = @"12.Supercat";
  [aStudent3 guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];

  EVAAnotherStudent *aStudent4 = [EVAAnotherStudent new];
  aStudent4.name = @"13.Supersnake";
  [aStudent4 guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  
  EVAAnotherStudent *aStudent5 = [EVAAnotherStudent new];
  aStudent5.name = @"14.Superstrawberry";
  [aStudent5 guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  
  EVAAnotherStudent *aStudent6 = [EVAAnotherStudent new];
  aStudent6.name = @"15.Superpipe";
  [aStudent6 guessAnswer:EVAPuzzleMake(500, INT_MIN / 1000, INT_MAX / 1000) callback:self.callback];
  
  return YES;
}

#pragma mark - Private methods

- (EVAStudent *)createStudentName:(NSString *)name {
  EVAStudent *student = [EVAStudent new];
  student.name = name;
  return student;
}

@end

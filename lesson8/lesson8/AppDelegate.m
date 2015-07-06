//
//  AppDelegate.m
//  lesson8
//
//  Created by Eugeny on 01/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#define SEPARATE NSLog(@"____________________________________\n\n");

#import "AppDelegate.h"
#import "EVAStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSArray *students = [EVAStudent generateRandomStudents:15];
  
  NSMutableDictionary *journal = [NSMutableDictionary new];
  for (EVAStudent *student in students) {
    [journal setObject:student forKey:[NSString stringWithFormat:@"%@ %@", student.lastName, student.name]];
  }
  
  NSLog(@"Journal: %@\n", journal.description);
  SEPARATE;
  
  for (id key in journal.allKeys) {
    NSLog(@"Name: %@  Surname: %@: -- Greeting: %@\n", [journal[key] name], [journal[key] lastName], [journal[key] greeting]);
  }
  SEPARATE;
  
  NSArray *sortedKeys = [journal.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    if ([obj1 isKindOfClass:[NSString class]] && [obj2 isKindOfClass:[NSString class]]) {
      return [obj1 compare:obj2];
    }
    return NSOrderedSame;
  }];
  
  for (id key in sortedKeys) {
    NSLog(@"Student: %@ -- Greeting: %@\n", (NSString *)key, [journal[key] greeting]);
  }
  SEPARATE;
  
  return YES;
}

@end
